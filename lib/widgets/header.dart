import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      child: Stack(
        // do not clip the items on this stack (for the glowing effect)
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // scale and offset the top logo
          Positioned(top: 45,
          child: Transform.scale(
            scale: 1.25, 
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/imgs/logo.png"),)
            )
          ),

        ],
      ),
    );
  }
}