import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:wfcd_client/enums.dart';
import 'package:wfcd_client/src/utils/json_utils.dart';
import 'package:wfcd_client/src/utils/exception_handler.dart';
import 'package:worldstate_api_model/misc.dart';
import 'package:dartx/dartx.dart';

enum RivenType { archgun, kitgun, melee, pistol, rifle, shotgun, zaw }

class RivenDataClient extends Equatable {
  const RivenDataClient(this.path, {this.platform = Platforms.pc});

  final String path;
  final Platforms platform;

  static const _baseUrl = 'https://api.warframestat.us';

  File get rivenData {
    return File('$path/riven_data_${platformToString(platform)}');
  }

  Future<void> downloadRivenData() async {
    final _platform = platformToString(platform);

    final response = await http.get('$_baseUrl/$_platform/rivens');
    final body = excpetionHandler(response, returnString: true) as String;

    await rivenData.writeAsString(body);
  }

  Future<RivenData> getArchgunRivenData(String key) async {
    final archguns = await getCategoryRivenData(RivenType.archgun);

    return archguns[key];
  }

  Future<RivenData> getKitgunRivenData(String key) async {
    final kitguns = await getCategoryRivenData(RivenType.kitgun);

    return kitguns[key];
  }

  Future<RivenData> getMeleeRivenData(String key) async {
    final melees = await getCategoryRivenData(RivenType.melee);

    return melees[key];
  }

  Future<RivenData> getPistolRivenData(String key) async {
    final pistols = await getCategoryRivenData(RivenType.pistol);

    return pistols[key];
  }

  Future<RivenData> getRifleRivenData(String key) async {
    final rifles = await getCategoryRivenData(RivenType.rifle);

    return rifles[key];
  }

  Future<RivenData> getShotgunRivenData(String key) async {
    final shotguns = await getCategoryRivenData(RivenType.shotgun);

    return shotguns[key];
  }

  Future<RivenData> getZawRivenData(String key) async {
    final zaws = await getCategoryRivenData(RivenType.zaw);

    return zaws[key];
  }

  Future<Map<String, RivenData>> getCategoryRivenData(RivenType type) async {
    final rivenType = type.toString().split('.').last;

    if (!rivenData.existsSync()) await downloadRivenData();

    return _getCategoryRivenData(rivenType);
  }

  Future<Map<String, RivenData>> _getCategoryRivenData(String type) async {
    final rivenData = await this.rivenData.readAsString();
    final data = json.decode(rivenData) as Map<String, dynamic>;

    final category =
        data['${type.capitalize()} Riven Mod'] as Map<String, dynamic>;

    return category?.map((String key, dynamic data) {
      return MapEntry(key, RivenData.fromJson(data as Map<String, dynamic>));
    });
  }

  RivenDataClient copyWith({String path, Platforms platform}) {
    return RivenDataClient(
      path ?? this.path,
      platform: platform ?? this.platform,
    );
  }

  @override
  List<Object> get props => [path, platform];
}
