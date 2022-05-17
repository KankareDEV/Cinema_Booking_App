import 'package:cinema_app/helpers/colors.dart';
import 'package:cinema_app/helpers/utils.dart';
import 'package:cinema_app/services/movieselection.service.dart';
import 'package:cinema_app/widgets/bottombar.dart';
import 'package:cinema_app/widgets/header.dart';
import 'package:cinema_app/widgets/movielistitem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/movie.model.dart';

// ignore: must_be_immutable
class MovieListPage extends StatelessWidget {
  List<MovieModel> movies = Utils.getMovies();
  late MovieSelectionService movieSelection;

  // process all movies
  Widget processMovieList() {
    List<Widget> movieListContainers = [];

    List<List<MovieModel>> moviesSubList = [];
    List<MovieModel> movieSubList = [];

    int remainderMovies = movies.length % 10;

    for (int i = 0; i < movies.length; i++) {
      movieSubList.add(movies[i]);

      if (movieSubList.length > 0 && movieSubList.length % 10 == 0) {
        moviesSubList.add(movieSubList);
        movieSubList = [];
      }

      if (movieSubList.length == remainderMovies && i == movies.length - 1) {
        moviesSubList.add(movieSubList);
      }
    }

    moviesSubList.forEach((List<MovieModel> movieList) => {
          movieListContainers.add(Container(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                MovieModel singleMovie = movieList[index];

                return MovieListItem(
                    movie: singleMovie,
                    onTap: () {
                      movieSelection.selectedMovie = singleMovie;
                      Navigator.of(context).pushNamed('/moviedetails');
                    });
              },
            ),
          ))
        });

    return Column(children: movieListContainers);
  }

  @override
  Widget build(BuildContext context) {
    movieSelection = Provider.of<MovieSelectionService>(context, listen: false);
    Widget scrollableMovieLists = processMovieList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // common header
          Header(),
          Center(
            child: Text(
              'Watch Your Favourite Movie',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipOval(
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                color: AmcColors.MAIN_RED,
                child: Text(movies.length.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ),
            ),
          ),
          Center(
            child: Text('Movies Playing Today',
                style: TextStyle(color: AmcColors.MAIN_RED, fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text('${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
          // center container
          Expanded(
            // stack (for the top / bottom shadow effect)
            child: Stack(
              children: [
                // using a SingleChildScrollView to allow
                // for vertical scrolling of the whole middle section
                // that includes all ListViews
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // some spacing at the top of all lists
                      SizedBox(height: 10),

                      // all scrollable lists of movies, processed above
                      scrollableMovieLists
                    ],
                  ),
                ),

                // top shadow (as gradient)
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    )),

                // bottom shadow (as gradient)
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ))
              ],
            ),
          ),

          // bottom common nav bar
          BottomBar()
        ],
      ),
    );
  }
}
