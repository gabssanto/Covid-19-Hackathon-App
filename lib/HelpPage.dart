import 'dart:convert';
import 'dart:async';
import 'package:covid19/mobx/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  void initState() {
    teste();
    super.initState();
  }

  //https://i3geo.saude.gov.br/i3geo/ogc.php?service=WFS&version=1.0.0&request=GetFeature&typeName=ubs_funcionamento&outputFormat=JSON
  Future<void> teste () async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/dataframe.json");
    final jsonResult = json.decode(data);
    var latitude = jsonResult['lat'];
    var longitude = jsonResult['long'];
    var name = jsonResult['no_fantasia'];
    var place = jsonResult['no_logradouro'];
    var number = jsonResult['nu_telefone'];
    var cep = jsonResult['co_cep'];
    var uf = jsonResult['uf'];
    var city = jsonResult['cidade'];
    print(latitude);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(handleLocations.latitude, handleLocations.longitude),
    zoom: handleLocations.accuracy,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(handleLocations.latitude, handleLocations.longitude),
      zoom: handleLocations.accuracy);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _goToTheLake,
        child: Icon(Icons.my_location, color: Colors.black54,),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
