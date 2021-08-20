import 'dart:convert';

ReadingsModel readingsModelFromJson(String str) => ReadingsModel.fromJson(json.decode(str));

String readingsModelToJson(ReadingsModel data) => json.encode(data.toJson());

class ReadingsModel {

  String id;
  String date;
  String value;

  ReadingsModel({
    required this.id,
    required this.date,
    required this.value,
  });

  factory ReadingsModel.fromJson(Map<String, dynamic> json) => ReadingsModel(
    id: json["id"],
    date: json["date"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "value": value,
  };

}