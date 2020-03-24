import 'dart:async';

import 'package:covid19/mobx/imports.dart';
import 'package:covid19/pages/help/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class UBSMap extends StatefulWidget {
  @override
  State<UBSMap> createState() => UBSMapState();
}

class UBSMapState extends State<UBSMap> {
  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(handleLocations.latitude, handleLocations.longitude),
    zoom: handleLocations.accuracy,
  );

  static final CameraPosition _currentPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(handleLocations.latitude, handleLocations.longitude),
      zoom: handleLocations.accuracy);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  BitmapDescriptor pinLocationIcon;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
          future: initValues(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? GoogleMap(
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
                        for (int i = 0;
                            i < handleLocations.ubsNames.length - 1;
                            i++) {
                          double minusLat = handleLocations.latitude -
                              double.parse(handleLocations.ubsLatitudes[i]);
                          double minusLong = handleLocations.longitude -
                              double.parse(handleLocations.ubsLongitudes[i]);
                          if (minusLat.abs() <= 0.1 && minusLong.abs() <= 0.1) {
                            _markers.add(Marker(
                              infoWindow: InfoWindow(
                                  title: handleLocations.ubsNames[i]
                                      .replaceAll("'", ''),
                                  snippet:
                                      'Clique aqui para navegar ate o local!',
                                  onTap: () => MapsLauncher.launchCoordinates(
                                      double.parse(
                                          handleLocations.ubsLatitudes[i]),
                                      double.parse(
                                          handleLocations.ubsLongitudes[i]))),
                              markerId: MarkerId(handleLocations.ubsNames[i]),
                              position: LatLng(
                                  double.parse(handleLocations.ubsLatitudes[i]),
                                  double.parse(
                                      handleLocations.ubsLongitudes[i])),
                              icon: pinLocationIcon,
                            ));
                          }
                        }
                      });
                    },
                  )
                : Center(child: CircularProgressIndicator());
          }),
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

  //https://i3geo.saude.gov.br/i3geo/ogc.php?service=WFS&version=1.0.0&request=GetFeature&typeName=ubs_funcionamento&outputFormat=JSON
  @override
  void initState() {
    super.initState();
    this.initValues();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/marker.png')
        .then((onValue) {
      pinLocationIcon = onValue;
    });
  }

  Future<void> initValues() async {
    String latitudes = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.latitudesTxt);
    String longitudes = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.longitudesTxt);
    String nomeFantasias = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.nomeFantasiasTxt);
    String nomeLogradouros = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.nomeLogradourosTxt);
    String numTelefone = await DefaultAssetBundle.of(context)
        .loadString('assets/nu_telefone.txt');
    String coCeps = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.coCepsTxt);
    String ufs = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.ufsTxt);
    String cidades = await DefaultAssetBundle.of(context)
        .loadString(ConstantsHelpPage.cidadesTxt);

    handleLocations.setUBS(
        latitudes.split(','),
        longitudes.split(','),
        nomeFantasias.split(','),
        nomeLogradouros.split(','),
        numTelefone.split(','),
        coCeps.split(','),
        ufs.split(','),
        cidades.split(','));

    // just to trigger snapshot.hasData
    return 'ok';
  }

  Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
  }
}
