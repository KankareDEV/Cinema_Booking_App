
import 'package:flutter/material.dart';

class BottomQuitButton extends StatelessWidget {

  final String? label;
  final Function onTap;
  bool isBackButton = false;

  BottomQuitButton({ 
    this.label, 
    this.isBackButton = false,
    required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Container(
        height: 55,
        child: Row(
          children: [
            Container(
              height: 47,
              color: Colors.black,
              child: Image.asset("assets/imgs/letter-x.png"),
            ),
          ],
        ),
      )
    );
  }

}