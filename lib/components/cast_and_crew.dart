import 'package:cinema_app/components/cast_card.dart';
import 'package:flutter/material.dart';

class CastAndCrew extends StatelessWidget {
  final List casts;

  const CastAndCrew({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          SizedBox(height: 20 / 1.5),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts.length,
              itemBuilder: (context, index) => CastCard(
                cast: casts[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
