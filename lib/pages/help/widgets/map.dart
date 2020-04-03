import 'dart:async';

import 'package:covid19/global/homePageAppBar.dart';
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MapDialog();
                                    });
                              },

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

class MapDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        height: MediaQuery.of(context).size.height - 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Icon(
                Icons.sentiment_very_satisfied,
                size: 60,
                color: Color(0xFF64f460),
              ),
            ),
            Container(
              child: Text("Obrigado pela informação \n",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.176,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: RichText(
                  text: new TextSpan(children: [
                    new TextSpan(
                        text:
                        "-Mantenha a higiene das mãos. Lave sempre que possível com água e sabão ou use álcool gel 70%.\n\n-Higiene respiratória é fundamental. Ao espirrar e tossir use um lenço descartável e jogue fora imediatamente. Se você não tem lenço descartável, a melhor forma de é espirrar e tossir na dobra do cotovelo.\n\n",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.154,
                        )),
                    new TextSpan(
                        text: "NUNCA ESPIRRE OU TUSSA NAS MÃOS",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff292727),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.154,
                        )),
                    new TextSpan(
                        text: ".\n\n",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff292727),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.154,
                        )),
                    new TextSpan(
                        text:
                        "-Evite aglomerações.\n\n-Se possível, fique em casa.\n\n-Não compartilhe objetos pessoais\n\n-Somente procure ajuda médica se houver agravamento dos sintomas.\n\n-Em caso de dúvidas, ligue para o Dique Saúde 136 do Ministério da Saúde.",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.154,
                        )),
                  ])),
            ),
            Container(
                width: 285,
                height: 49,
                decoration: new BoxDecoration(
                    color: Color(0xFF64f460),
                    borderRadius: BorderRadius.circular(14)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Fechar",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.165,
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}