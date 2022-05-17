
import 'package:cinema_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          // background image
          Positioned.fill(
            child: Image.asset('./assets/imgs/amc_intro_bg.png',
              fit: BoxFit.cover
            )
          ),
          // center container
          Positioned.fill(
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  main logo
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/imgs/logo.png"),
                    ),
                    SizedBox(height: 80),
                    // title
                    Column(
                      children: [
                        Text("Welcome to", style: TextStyle(color: Colors.white, fontSize: 30)),
                        Text("FinnKino", style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 70),
                    // button row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // circle btn widget
                        CircleButton(
                          icon: Icons.touch_app,
                          label: "Purchase Tickets",
                          onTap: () {
                            Navigator.of(context).pushNamed('/movielist');
                          },
                        ),
                        SizedBox(width: 35),
                        // circle btn widget
                        CircleButton(
                          icon: Icons.confirmation_num,
                          label: "Pick up Tickets",
                          onTap: () {
                            // ignore: todo
                            // TODO: no implementation yet
                          },
                        ),
                      ],
                    )
                  ],
                )
              )
            ),
        ],
      ),
    );
  }
}
