import 'package:flutter/material.dart';

import '../helpers/colors.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {
  int? duration = 0;
  String? goToPage;

  SplashPage({ this.goToPage, this.duration });

  @override 
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration!), () {
      Navigator.of(context).
      pushNamed(this.goToPage!);
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 200),
            child: CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/imgs/logo.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 350),
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 255, 255, 255) .withOpacity(0.5)),
                  )
                )
              )
            )
        ],
      )
    );
  }
}