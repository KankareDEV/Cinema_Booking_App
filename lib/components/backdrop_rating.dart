import 'package:cinema_app/models/movie.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({
    Key? key,
    required this.size,
    required this.selectedMovie,
    required this.isLiked,
    required this.likeCount,
  }) : super(key: key);

  final Size size;
  final MovieModel selectedMovie;
  final bool isLiked;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 40% of our total height
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(selectedMovie.imgPath!),
              ),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.7,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFFf6c444),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color.fromARGB(255, 59, 59, 59),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset('assets/imgs/star_fill.svg',
                            color: Colors.black),
                        SizedBox(height: 20.0 / 4),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "${selectedMovie.rating!}/10",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Rate this
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: LikeButton(
                              size: 37,
                              isLiked: isLiked,
                              likeCount: likeCount,
                              countPostion: CountPostion.bottom,
                              countBuilder: (count, isLiked, text) {
                                return Text(
                                  text,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  // Metascore
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 50,
                        child: Image.asset(
                          'assets/imgs/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.0 / 4),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
