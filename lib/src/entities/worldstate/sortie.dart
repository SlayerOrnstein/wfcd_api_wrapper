import 'package:equatable/equatable.dart';

import '../../../objects.dart';
import 'mission.dart';

class Sortie extends WorldstateObject {
  const Sortie({
    required String id,
    required DateTime activation,
    required DateTime expiry,
    required this.boss,
    required this.faction,
    required this.factionKey,
    required this.variants,
    required this.missions,
  }) : super(id: id, activation: activation, expiry: expiry);

  final String boss, faction;
  final String? factionKey;
  final List<Variant> variants;
  final List<Mission> missions;

  @override
  List<Object?> get props =>
      super.props..addAll([boss, faction, factionKey, variants, missions]);
}

class Variant extends Equatable {
  const Variant({
    required this.missionType,
    required this.modifier,
    required this.modifierDescription,
    required this.node,
  });

  final String missionType, modifier, modifierDescription, node;

  @override
  List<Object?> get props => [missionType, modifier, modifierDescription, node];
}
