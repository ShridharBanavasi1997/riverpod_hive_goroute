import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'state_data.g.dart';

@HiveType(typeId: 1)
class StateData extends HiveObject {
  StateData({required this.icon, required this.color, required this.size});

  @HiveField(0)
  int icon;

  @HiveField(1)
  int color;

  @HiveField(2)
  double size;

  static String hiveBoxName = "State";

  factory StateData.fromMap(Map<String, dynamic> json) => StateData(
      icon: json["Icon"] ? null : json["Icon"],
      color: json["Color"] ? null : json["Color"],
      size: json["Size"] ? null : json["Size"]);

  Map<String,dynamic> toMap() => {
    "Icon" : icon == null ? null : icon,
    "Color" : color == null ? null : color,
    "Size" : size == null ? null : size,
  };
}
