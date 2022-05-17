import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class CircleButton extends StatelessWidget {

  final IconData? icon;
  final String? label;
  Function onTap;

  CircleButton({ this.label, this.icon, required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(27),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(255, 0, 0, 0)
              ),
              child: Icon(
                this.icon,
                size: 40,
                color: Color.fromARGB(255, 232, 193, 63)  
              )
            ),
            Container(
              width: 180, 
              child: Text(this.label!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20  
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

}