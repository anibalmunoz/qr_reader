// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ScanModel welcomeFromJson(String str) => ScanModel.fromJson(json.decode(str));
String welcomeToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (tipo.contains("http")) {
      tipo = "http";
    } else {
      tipo = "geo";
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
