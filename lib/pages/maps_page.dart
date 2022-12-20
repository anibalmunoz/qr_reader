import 'package:flutter/material.dart';
import 'package:qr_reader/utils/app_color.dart';
import 'package:qr_reader/utils/app_config.dart';
import 'package:qr_reader/widgets/general_listview.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralListViewWidget(icon: Icons.map_outlined, tipo: AppConfig.shared.geo);
  }
}
