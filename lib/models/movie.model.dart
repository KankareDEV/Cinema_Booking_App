import 'movietime.model.dart';

class MovieModel {
  String? imgPath;
  String? title;
  String? description;
  String? castInfo;
  String? duration;
  String? ratedInfo;
  String? rating;
  String? year;
  String? pg;
  List<MovieTimeModel>? availableTimes;
  List<Map>? cast;

  MovieModel({
    this.imgPath,
    this.title,
    this.description,
    this.castInfo,
    this.duration,
    this.ratedInfo,
    this.availableTimes,
    this.rating,
    this.year,
    this.pg,
    this.cast,
  });
}
