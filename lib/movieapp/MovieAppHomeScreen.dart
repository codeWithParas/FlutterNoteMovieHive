

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jan_batch/movieapp/repository/HiveDatabaseHandler.dart';
import 'package:flutter_jan_batch/test/TestDartProg.dart';
import 'package:http/http.dart';

import 'model/MovieData.dart';

class MovieAppHomePage extends StatefulWidget {
  const MovieAppHomePage({super.key});

  @override
  State<MovieAppHomePage> createState() => _MovieAppHomePageState();
}

class _MovieAppHomePageState extends State<MovieAppHomePage> {

  var hiveDatabaseHandler = HiveDatabaseHandler();

  List<Movie> movies = [];
  List<Movie> topRatedMovies = [];
  var IMAGE_URL = 'https://image.tmdb.org/t/p/w500';
  var POPULAR_API = 'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=dee8af777f2e8990d4b19baad0388e42&page=3';

  @override
  void initState() {
    // TODO: implement initState
    if(movies.isEmpty) {
      fetchDataFromServer();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies & Shows"),
      ),
      body: getMovieListView(),
    );
  }

  void fetchDataFromServer() async{
    // Get API details
    // Create server http channel
    Response response = await get(Uri.parse(POPULAR_API));
    print("##### RESPONSE ##### ${response.body.toString()}");

    if(response.statusCode == 200) {
      print("##### SUCCESS #####");
      _showAlertDialog('SUCCESS', 'Data Loaded Successfully.');
      // 1) Convert our json data to map object
      var mappedData = jsonDecode(response.body.toString());
      // 2) Convert mapped object to our model object
      MovieData movieData = MovieData.fromJsonMapped(mappedData);
      // 3) Show this on ui
      setState(() {
        hiveDatabaseHandler.addListItemsIntoMainBox(movieData);
        Future<List<Movie>> moviesFuture = hiveDatabaseHandler.loadItemsFromMainBox();
        moviesFuture.then((movieList) {
          print("##### LOAD DATA ON UI ${movieList.length} #####");
          movies.addAll(movieList);
        });

        //movies.addAll(movieData.results);
      });

    } else {
      print("##### FAILURE #####");
      _showAlertDialog('FAILURE', 'Something went wrong');
    }
  }

  void _showAlertDialog(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  SingleChildScrollView getMovieListView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IntrinsicHeight(
                      child: SizedBox(
                        width: 120,
                        height: 200,
                        child: Image.network(
                            '$IMAGE_URL${movies[index].poster_path}'
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}










