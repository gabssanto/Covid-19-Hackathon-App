import 'package:covid19/global/backAppBar.dart';
import 'package:covid19/global/generalAppBar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(title: 'Perfil',),
      body: Container(
        height: double.infinity,
        color: Color(0xffefefef),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height - 150,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.account_circle, size: 60, color: Colors.black54,),
                    Text("Gabriel Alves",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff27b3ff),
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.231,

                        )
                    )

                  ],
                ),
            ),
          ],
        )
      ),
    );
  }
}
