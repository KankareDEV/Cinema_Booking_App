import 'dart:ui';
import 'package:cinema_app/components/backdrop_rating.dart';
import 'package:cinema_app/components/cast_and_crew.dart';
import 'package:cinema_app/components/ticket_time.dart';
import 'package:cinema_app/components/title_duration_and_fav_btn.dart';
import 'package:cinema_app/models/movie.model.dart';
import 'package:cinema_app/services/movieselection.service.dart';
import 'package:cinema_app/widgets/bottombar.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  bool isLiked = false;
  int likeCount = 320;
  @override
  Widget build(BuildContext context) {
    MovieSelectionService movieService =
        Provider.of<MovieSelectionService>(context, listen: false);
    MovieModel selectedMovie = movieService.selectedMovie!;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      // use a Stack widget to add the movie poster in the background (faded)
      body: Column(
        children: [
          BackdropAndRating(
              size: size,
              selectedMovie: selectedMovie,
              isLiked: isLiked,
              likeCount: likeCount),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TitleDurationAndFabBtn(selectedMovie: selectedMovie),
                ),
                TicketTime(
                  selectedMovie: selectedMovie,
                  movieService: movieService,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20 / 2,
                    horizontal: 20,
                  ),
                  child: Text(
                    'Plot Summary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    selectedMovie.description!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                CastAndCrew(casts: selectedMovie.cast!),
              ],
            ),
          ),
          BottomBar()
        ],
      ),
    );
  }
}
