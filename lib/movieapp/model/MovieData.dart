

/*
* 1) Create Models
* @HiveType(typeId: 0): This annotation tells Hive that this class is a custom type. The typeId must be unique for each class you register.
* @HiveField(0): This annotation tells Hive that name is a field. The number is the index of the field.
* @HiveField(1): This annotation tells Hive that price is a field. The number is the index of the field.
* part 'product.g.dart';: This line tells Hive to generate the code for this class.
*
* -------Hive needs a way to convert your Product objects to and from a binary format. This is done using a type adapter.
*
* 2) dev_dependencies : hive_generator: ^2.0.0
* 3) Run command : flutter pub run build_runner or flutter pub run build_runner build
* 4) This will generate the `product.g.dart` file.
* 5) Register the Adapter : Hive.registerAdapter(ProductAdapter());
*
* */

import 'package:hive/hive.dart';

part 'MovieData.g.dart';

@HiveType(typeId: 0)
class MovieData{
  @HiveField(0)
  int page;

  @HiveField(1)
  List<Movie> results;

  MovieData({required this.page, required this.results});

  // Factory Convert mapped to object
  factory MovieData.fromJsonMapped(Map<String, dynamic> mappedJson) {

    List<dynamic> mappedMovieList = mappedJson["results"];

    List<Movie> movieList = List<Movie>.from(
        mappedMovieList.map<Movie>((dynamic mappedMovie) =>
          // Convert mapped movie to Movie Object
          Movie.fromMappedJson(mappedMovie)
        )
    );

    return MovieData(
        page: mappedJson["page"],
        results: movieList
    );
  }
}

@HiveType(typeId: 1)
class Movie {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String poster_path;

  @HiveField(3)
  int vote_count;

  Movie(
      {required this.id,
      required this.title,
      required this.poster_path,
      required this.vote_count});

  factory Movie.fromMappedJson(Map<String, dynamic> mappedMovie){
    return Movie(
        id: mappedMovie["id"],
        title: mappedMovie["title"],
        poster_path: mappedMovie["poster_path"],
        vote_count: mappedMovie["vote_count"]
    );
  }
}
