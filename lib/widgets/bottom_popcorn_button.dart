import 'package:cinema_app/helpers/colors.dart';
import 'package:flutter/material.dart';

class BottomPopcornButton extends StatelessWidget {

  final String? label;
  final Function onTap;
  bool isBackButton = false;

  BottomPopcornButton({ 
    this.label, 
    this.isBackButton = false,
    required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap as void Function()?,
      child: Container(
        height: 65,
        child: Row(
          children: [
            Container(
              height: 80,
              color: Colors.black,
              child: Image.asset("assets/imgs/popcorn.png"),
            ),
          ],
        ),
      )
    );
  }

}