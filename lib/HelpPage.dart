import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/generalAppBar.dart';
import 'package:covid19/mobx/imports.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    super.initState();
  }
  //https://i3geo.saude.gov.br/i3geo/ogc.php?service=WFS&version=1.0.0&request=GetFeature&typeName=ubs_funcionamento&outputFormat=JSON

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: 'Ajuda',
      ),
      body: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(handleLocations.latitude, handleLocations.longitude),
    zoom: handleLocations.accuracy,
  );

  static final CameraPosition _currentPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(handleLocations.latitude, handleLocations.longitude),
      zoom: handleLocations.accuracy);

  Set<Marker> _markers = {};

  BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/marker.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        markers: _markers,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        buildingsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            for (int i = 0; i < handleLocations.ubsNames.length - 1; i++) {
              double minusLat = handleLocations.latitude -
                  double.parse(handleLocations.ubsLatitudes[i]);
              double minusLong = handleLocations.longitude -
                  double.parse(handleLocations.ubsLongitudes[i]);
              if (minusLat.abs() <= 0.1 && minusLong.abs() <= 0.1) {
                _markers.add(Marker(
                  infoWindow: InfoWindow(
                      title: handleLocations.ubsNames[i].replaceAll("'", ''),
                      snippet: 'Clique aqui para navegar ate o local!',
                      onTap: () => MapsLauncher.launchCoordinates(
                          double.parse(handleLocations.ubsLatitudes[i]),
                          double.parse(handleLocations.ubsLongitudes[i]))),
                  markerId: MarkerId(handleLocations.ubsNames[i]),
                  position: LatLng(
                      double.parse(handleLocations.ubsLatitudes[i]),
                      double.parse(handleLocations.ubsLongitudes[i])),
                  icon: pinLocationIcon,
                ));
              }
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _goToCurrentPosition,
        child: Icon(
          Icons.my_location,
          color: Color(0xff27b3ff),
        ),
      ),
    );
  }

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
  }
}
