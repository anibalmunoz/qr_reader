import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

    CameraPosition puntoInicial = CameraPosition(target: scan.getLatLng(), zoom: 18, tilt: 50);

    // Marcadores
    Set<Marker> markers = {};
    markers.add(Marker(markerId: const MarkerId("geo-1"), position: scan.getLatLng()));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await mapController.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(target: scan.getLatLng(), zoom: 18, tilt: 50)));
              },
              icon: const Icon(Icons.location_history))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) => mapController.complete(controller),
        markers: markers,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
