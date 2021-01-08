import 'package:json_annotation/json_annotation.dart';

import '../../entities/worldstate/void_trader.dart';

part 'void_trader_model.g.dart';

@JsonSerializable()
class VoidTraderModel extends VoidTrader {
  const VoidTraderModel({
    required String id,
    required DateTime activation,
    required DateTime expiry,
    required String character,
    required String location,
    required bool active,
    required this.inventory,
  }) : super(
          id: id,
          activation: activation,
          expiry: expiry,
          character: character,
          location: location,
          active: active,
          inventory: inventory,
        );

  factory VoidTraderModel.fromJson(Map<String, dynamic> json) {
    return _$VoidTraderModelFromJson(json);
  }

  @override
  final List<InventoryItemModel> inventory;

  Map<String, dynamic> toJson() => _$VoidTraderModelToJson(this);
}

@JsonSerializable()
class InventoryItemModel extends InventoryItem {
  const InventoryItemModel({
    required String item,
    required int ducats,
    required int credits,
  }) : super(item: item, ducats: ducats, credits: credits);

  factory InventoryItemModel.fromJson(Map<String, dynamic> json) {
    return _$InventoryItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InventoryItemModelToJson(this);
}
