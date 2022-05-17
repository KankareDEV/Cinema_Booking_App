import 'package:cinema_app/models/movie.model.dart';
import 'package:cinema_app/services/movieselection.service.dart';
import 'package:flutter/material.dart';

class TicketTime extends StatelessWidget {
  const TicketTime({
    Key? key,
    required this.selectedMovie,
    required this.movieService,
  }) : super(key: key);

  final MovieModel selectedMovie;
  final MovieSelectionService movieService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        childAspectRatio: 2,
        padding: EdgeInsets.only(top: 10),
        shrinkWrap: true,
        crossAxisCount: 4,
        children: List.generate(
          selectedMovie.availableTimes!.length,
          (index) {
            return GestureDetector(
              onTap: () {
                movieService
                    .selectMovieTime(selectedMovie.availableTimes![index]);
                Navigator.of(context).pushNamed('/ticketselection');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 8, bottom: 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Text('${selectedMovie.availableTimes![index].time}',
                    style: TextStyle(color: Color(0xFFf6c444), fontSize: 15)),
              ),
            );
          },
        ),
      ),
    );
  }
}
