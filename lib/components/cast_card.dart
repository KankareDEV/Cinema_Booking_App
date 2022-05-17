import 'package:flutter/material.dart';

class CastCard extends StatelessWidget {
  final Map cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 70,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          SizedBox(height: 20 / 2),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 20 / 4),
          Text(
            cast['movieName'],
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFf6c444),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
