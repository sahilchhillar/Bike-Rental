import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<StatefulWidget> createState() => _DestinationPage();
}

class _DestinationPage extends State<DestinationPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(initialCameraPosition: CameraPosition(target: _center, zoom: 11), onMapCreated: _onMapCreated,)
    );
  }
}
