import 'dart:convert';

WeighingModel weighingModelFromJson(String str) => WeighingModel.fromJson(json.decode(str));

String weighingModelToJson(WeighingModel data) => json.encode(data.toJson());

class WeighingModel {

  String id;
  String date;
  double weight;

  WeighingModel({
    required this.id,
    required this.date,
    required this.weight,
  });

  factory WeighingModel.fromJson(Map<String, dynamic> json) => WeighingModel(
    id: json["id"],
    date: json["date"],
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "weight": weight,
  };

}