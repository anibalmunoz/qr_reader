import 'package:flutter/material.dart';
import 'package:qr_reader/utils/app_config.dart';
import 'package:qr_reader/widgets/general_listview.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key? key}) : super(key: key);
  static const routeName = "direcciones";

  @override
  Widget build(BuildContext context) {
    return GeneralListViewWidget(icon: Icons.compass_calibration_outlined, tipo: AppConfig.shared.http);
  }
}
