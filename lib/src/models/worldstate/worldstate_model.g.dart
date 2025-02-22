// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worldstate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldstateModel _$WorldstateModelFromJson(Map json) => $checkedCreate(
      'WorldstateModel',
      json,
      ($checkedConvert) {
        final val = WorldstateModel(
          timestamp:
              $checkedConvert('timestamp', (v) => DateTime.parse(v as String)),
          news: $checkedConvert(
              'news',
              (v) => (v as List<dynamic>)
                  .map((e) => OrbiterNewsModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          events: $checkedConvert(
              'events',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      EventModel.fromJson(Map<String, dynamic>.from(e as Map)))
                  .toList()),
          alerts: $checkedConvert(
              'alerts',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      AlertModel.fromJson(Map<String, dynamic>.from(e as Map)))
                  .toList()),
          sortie: $checkedConvert('sortie',
              (v) => SortieModel.fromJson(Map<String, dynamic>.from(v as Map))),
          archonHunt: $checkedConvert('archonHunt',
              (v) => SortieModel.fromJson(Map<String, dynamic>.from(v as Map))),
          syndicateMissions: $checkedConvert(
              'syndicateMissions',
              (v) => (v as List<dynamic>)
                  .map((e) => SyndicateModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          fissures: $checkedConvert(
              'fissures',
              (v) => (v as List<dynamic>)
                  .map((e) => VoidFissureModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          invasions: $checkedConvert(
              'invasions',
              (v) => (v as List<dynamic>)
                  .map((e) => InvasionModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          voidTrader: $checkedConvert(
              'voidTrader',
              (v) => VoidTraderModel.fromJson(
                  Map<String, dynamic>.from(v as Map))),
          dailyDeals: $checkedConvert(
              'dailyDeals',
              (v) => (v as List<dynamic>)
                  .map((e) => DarvoDealModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          persistentEnemies: $checkedConvert(
              'persistentEnemies',
              (v) => (v as List<dynamic>)
                  .map((e) => PersistentEnemyModel.fromJson(
                      Map<String, dynamic>.from(e as Map)))
                  .toList()),
          earthCycle: $checkedConvert('earthCycle',
              (v) => EarthModel.fromJson(Map<String, dynamic>.from(v as Map))),
          cetusCycle: $checkedConvert('cetusCycle',
              (v) => EarthModel.fromJson(Map<String, dynamic>.from(v as Map))),
          constructionProgress: $checkedConvert(
              'constructionProgress',
              (v) => ConstructionProgressModel.fromJson(
                  Map<String, dynamic>.from(v as Map))),
          vallisCycle: $checkedConvert('vallisCycle',
              (v) => VallisModel.fromJson(Map<String, dynamic>.from(v as Map))),
          nightwave: $checkedConvert(
              'nightwave',
              (v) => v == null
                  ? null
                  : NightwaveModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          sentientOutposts: $checkedConvert(
              'sentientOutposts',
              (v) => SentientOutpostModel.fromJson(
                  Map<String, dynamic>.from(v as Map))),
          arbitration: $checkedConvert(
              'arbitration',
              (v) => v == null
                  ? null
                  : ArbitrationModel.fromJson(
                      Map<String, dynamic>.from(v as Map))),
          steelPath: $checkedConvert(
              'steelPath',
              (v) =>
                  SteelPathModel.fromJson(Map<String, dynamic>.from(v as Map))),
          zarimanCycle: $checkedConvert(
              'zarimanCycle',
              (v) =>
                  ZarimanModel.fromJson(Map<String, dynamic>.from(v as Map))),
        );
        return val;
      },
    );

Map<String, dynamic> _$WorldstateModelToJson(WorldstateModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'news': instance.news.map((e) => e.toJson()).toList(),
      'events': instance.events.map((e) => e.toJson()).toList(),
      'alerts': instance.alerts.map((e) => e.toJson()).toList(),
      'sortie': instance.sortie.toJson(),
      'archonHunt': instance.archonHunt.toJson(),
      'syndicateMissions':
          instance.syndicateMissions.map((e) => e.toJson()).toList(),
      'fissures': instance.fissures.map((e) => e.toJson()).toList(),
      'invasions': instance.invasions.map((e) => e.toJson()).toList(),
      'voidTrader': instance.voidTrader.toJson(),
      'dailyDeals': instance.dailyDeals.map((e) => e.toJson()).toList(),
      'persistentEnemies':
          instance.persistentEnemies.map((e) => e.toJson()).toList(),
      'earthCycle': instance.earthCycle.toJson(),
      'cetusCycle': instance.cetusCycle.toJson(),
      'constructionProgress': instance.constructionProgress.toJson(),
      'vallisCycle': instance.vallisCycle.toJson(),
      'nightwave': instance.nightwave?.toJson(),
      'sentientOutposts': instance.sentientOutposts.toJson(),
      'arbitration': instance.arbitration?.toJson(),
      'steelPath': instance.steelPath.toJson(),
      'zarimanCycle': instance.zarimanCycle.toJson(),
    };
