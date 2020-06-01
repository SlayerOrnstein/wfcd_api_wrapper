import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:warframestat_api_models/warframestat_api_models.dart';
import 'package:wfcd_client/base.dart';
import 'package:wfcd_client/src/local/warframestate_local.dart';
import 'package:wfcd_client/src/remotes/warframestat_remote.dart';
import 'package:wfcd_client/src/utils/json_utils.dart';

import 'fixtures/fixture_reader.dart';

class MockBox<E> extends Mock implements Box<E> {}

class MockClient extends Mock implements http.Client {}

void main() {
  const headers = {'content-type': 'application/json; charset=utf-8'};

  final worldstateFixture = fixture('worldstate.json');
  final searchFixture = fixture('search_results.json');
  final targetFixtures = fixture('synthTargets.json');
  final dealResultFixtures = fixture('darvo_deal_test.json');

  final testWorldstate = WorldstateModel.fromJson(
      json.decode(worldstateFixture) as Map<String, dynamic>);

  final testSearch = toBaseItem(json.decode(searchFixture) as List<dynamic>);

  final testTargets = (json.decode(targetFixtures) as List<dynamic>)
      .map((dynamic t) => SynthTargetModel.fromJson(t as Map<String, dynamic>))
      .toList();

  final testDealResults = (json.decode(dealResultFixtures) as List<dynamic>)
      .map((dynamic t) => BaseItemModel.fromJson(t as Map<String, dynamic>))
      .toList();

  Box<dynamic> mockBox;
  http.Client mockClient;

  WarframestatCache cache;
  WarframestatRemote remote;

  setUp(() {
    mockBox = MockBox<dynamic>();
    mockClient = MockClient();

    cache = WarframestatCache(mockBox);
    remote = WarframestatRemote(mockClient);
  });

  group('WarframestateRemote', () {
    test('getWorldstate', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(worldstateFixture, 200, headers: headers));

      final worldstate = await remote.getWorldstate(GamePlatforms.pc);

      expect(worldstate, equals(testWorldstate));
    });

    test('getSynthTargets', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(targetFixtures, 200, headers: headers));

      final targets = await remote.getSynthTargets();

      expect(targets, equals(testTargets));
    });

    test('searchItems', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(searchFixture, 200, headers: headers));

      final results = await remote.searchItems('chroma');

      expect(results, equals(testSearch));
    });
  });

  group('WarframestatCache', () {
    group('worldstate', () {
      test('cache worldstate', () {
        when<dynamic>(mockBox.get(any)).thenAnswer((_) => testWorldstate);

        cache.cacheWorldstate(testWorldstate);

        final worldstate = cache.getCachedState();

        expect(worldstate, equals(testWorldstate));
      });
    });

    group('SynthTargets', () {
      test('cache SynthTargets', () {
        when<dynamic>(mockBox.get(any)).thenAnswer((_) => testTargets);

        cache.cacheSynthTargets(testTargets);

        final targets = cache.getCachedTargets();

        expect(targets, equals(testTargets));
      });
    });

    group('Darvo Deal Item', () {
      test('cache daily deal', () {
        final deal = testWorldstate.dailyDeals.first;
        final dealItem =
            testDealResults.firstWhere((i) => deal.item.contains(i.name));

        when<dynamic>(mockBox.get(any)).thenAnswer((_) => dealItem);

        cache.cacheDealInfo(deal.id, dealItem);

        final cachedDeal = cache.getCachedDeal();

        expect(cachedDeal, equals(dealItem));
      });
    });
  });
}
