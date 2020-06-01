import 'package:warframestat_api_models/warframestat_api_models.dart';

List<BaseItem> toBaseItem(List<dynamic> data) {
  return data.map<BaseItem>((dynamic i) {
    return _toBaseItem(i as Map<String, dynamic>);
  }).toList();
}

// Only reason this is being ignored is becasue the switch statement works fine
// but it's being flagged as not returning ItemObject anyways
// ignore: missing_return
BaseItem _toBaseItem(Map<String, dynamic> item) {
  switch (item['category'] as String) {
    case 'Archwings':
      continue warframe;
    case 'Pets':
      continue warframe;
    case 'Sentinels':
      continue warframe;

    case 'Secondry':
      continue weapon;
    case 'Melee':
      continue weapon;
    case 'Arch-Gun':
      continue weapon;
    case 'Arch-Melee':
      continue weapon;

    warframe:
    case 'Warframes':
      return BioWeaponModel.fromJson(item);
    weapon:
    case 'Primary':
      return WeaponModel.fromJson(item);

    default:
      return BaseItemModel.fromJson(item);
  }
}

List<SynthTarget> toSynthTargets(List<dynamic> data) {
  return data.map<SynthTarget>((dynamic t) {
    return SynthTargetModel.fromJson(t as Map<String, dynamic>);
  }).toList();
}
