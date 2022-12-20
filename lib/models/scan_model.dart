// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:qr_reader/utils/app_config.dart';

ScanModel welcomeFromJson(String str) => ScanModel.fromJson(json.decode(str));
String welcomeToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String? tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains(AppConfig.shared.http)) {
      tipo = "http";
    } else {
      tipo = AppConfig.shared.geo;
    }
  }

  LatLng getLatLng() {
    final latLng = valor.substring(4).split(",");
    final latitude = double.parse(latLng[0]);
    final longitude = double.parse(latLng[1]);
    return LatLng(latitude, longitude);
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
