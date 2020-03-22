import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:covid19/mobx/imports.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    String latitudes = await DefaultAssetBundle.of(context).loadString('assets/lat.txt');
    String longitudes = await DefaultAssetBundle.of(context).loadString('assets/long.txt');
    String no_fantasias = await DefaultAssetBundle.of(context).loadString('assets/no_fantasia.txt');
    String no_logradouros = await DefaultAssetBundle.of(context).loadString('assets/no_logradouro.txt');
    String nu_telefone = await DefaultAssetBundle.of(context).loadString('assets/nu_telefone.txt');
    String co_ceps = await DefaultAssetBundle.of(context).loadString('assets/co_cep.txt');
    String ufs = await DefaultAssetBundle.of(context).loadString('assets/uf.txt');
    String cidades = await DefaultAssetBundle.of(context).loadString('assets/cidade.txt');


    //String data = await DefaultAssetBundle.of(context).loadString("assets/dataframe.json");
    //final jsonResult = json.decode(data);
    handleLocations.setUBS(latitudes.split(','), longitudes.split(','), no_fantasias.split(','), no_logradouros.split(','), nu_telefone.split(','), co_ceps.split(','), ufs.split(','), cidades.split(','));
    //print(handleLocations.ubsNames.length);
    /*handleLocations.setUBS(
        jsonResult['lat'],
        jsonResult['long'],
        jsonResult['no_fantasia'],
        jsonResult['no_logradouro'],
        jsonResult['nu_telefone'],
        jsonResult['co_cep'],
        jsonResult['uf'],
        jsonResult['cidade']
    );*/
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
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/pin.png').then((onValue) {
      pinLocationIcon = onValue;
    });
    super.initState();
  }

/*
  loadAsset() async {
    final myData = await rootBundle.loadString("assets/dataframe.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
    print(data.map((e) {
      return e;
    }).toList()[1][1]);
  }
*/

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(handleLocations.latitude, handleLocations.longitude),
        icon: pinLocationIcon,
      ),
    ].toSet();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        markers: _markers,
        myLocationButtonEnabled: true,
        buildingsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            for(int i = 0; i < handleLocations.ubsNames.length-1; i++) {
              double minusLat = handleLocations.latitude - double.parse(handleLocations.ubsLatitudes[i]);
              double minusLong = handleLocations.longitude - double.parse(handleLocations.ubsLongitudes[i]);
              if(minusLat.abs() <= 0.1 && minusLong.abs() <= 0.1) {
                _markers.add(
                    Marker(
                      markerId: MarkerId(handleLocations.ubsNames[i]),
                      position: LatLng(double.parse(handleLocations.ubsLatitudes[i]), double.parse(handleLocations.ubsLongitudes[i])),
                      icon: pinLocationIcon,
                    )
                );
              }
            }
          });
          },
      ),

    );
  }

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
  }
}
