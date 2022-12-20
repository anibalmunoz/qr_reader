import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/url_navigation.dart';

class GeneralListViewWidget extends StatelessWidget {
  final IconData icon;
  final String tipo;
  const GeneralListViewWidget({Key? key, required this.icon, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScanListProvider>(context);
    final scans = provider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        direction: DismissDirection.startToEnd,
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (direction) =>
            Provider.of<ScanListProvider>(context, listen: false).borrarScanById(scans[index].id!),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(scans[index].valor),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[index]),
        ),
      ),
    );
  }
}
