import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/pages/map_page.dart';
import 'package:qr_reader/utils/app_config.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchURL(context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipo == AppConfig.shared.http) {
    await launchUrlString(url);
  } else {
    Navigator.pushNamed(context, MapPage.routeName, arguments: scan);
  }
}
