import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/url_navigation.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#3D8BEF", "Cancelar", false, ScanMode.QR);
        final barcodeScanRes = "geo:14.610194705386023,-90.51548110190717";
        if (barcodeScanRes == "-1") return;
        final scanlistProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanlistProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
