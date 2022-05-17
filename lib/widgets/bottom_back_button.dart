import 'package:cinema_app/helpers/colors.dart';
import 'package:flutter/material.dart';

class BottomBackButton extends StatelessWidget {

  final String? label;
  final Function onTap;
  bool isBackButton = false;

  BottomBackButton({ 
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
              child: Image.asset("assets/imgs/backk.png"),
            ),
          ],
        ),
      )
    );
  }

}