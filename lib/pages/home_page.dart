import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/maps_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/utils/app_config.dart';
import 'package:qr_reader/widgets/custom_navigator_bar.dart';

import '../widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppbar(context),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

AppBar _customAppbar(context) {
  final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
  return AppBar(
    centerTitle: true,
    title: const Text("Historial"),
    actions: [IconButton(onPressed: () => scanListProvider.borrarTodos(), icon: const Icon(Icons.delete_forever))],
  );
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo(AppConfig.shared.geo);
        return const MapsPage();
      case 1:
        scanListProvider.cargarScansPorTipo(AppConfig.shared.http);
        return const DirectionsPage();
      default:
        return const MapsPage();
    }
  }
}
