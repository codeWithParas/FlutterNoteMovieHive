


//import 'package:hive/hive.dart';

import 'package:flutter_jan_batch/movieapp/model/MovieData.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabaseHandler {

  String hiveMainBoxName = 'hive_movie_box';
  String hiveMovieListBoxName = 'hive_movie_list_box';
  static late Box boxMainMovie;
  static late Box boxMovieList;

  // HiveDatabaseHandler Singleton type object
  static HiveDatabaseHandler? _hiveDatabaseHandler;

  HiveDatabaseHandler._createInstance();

  factory HiveDatabaseHandler() {
    if(_hiveDatabaseHandler == null) {
      _hiveDatabaseHandler = HiveDatabaseHandler._createInstance();
    }

    return _hiveDatabaseHandler ?? HiveDatabaseHandler._createInstance();
  }

  initHiveDatabase() async {
    //await Hive.initFlutter();
    await Hive.initFlutter();
    Hive.registerAdapter(MovieDataAdapter());
    Hive.registerAdapter(MovieAdapter());
    boxMainMovie = await Hive.openBox<MovieData>(hiveMainBoxName);
    boxMovieList = await Hive.openBox<Movie>(hiveMovieListBoxName);
  }

  // Insert Operation
  // Add List Items Into MainBox
  addListItemsIntoMainBox(MovieData movieData) async{
    //final box = await Hive.box<MovieData>(hiveMainBoxName);
    // box may contain previous data
    // Fetch previous model(first entry) and then store complete list
    print("##### INSERT DATA INTO HIVE DATABASE #####");
    MovieData mainModel;
    if(boxMainMovie.isEmpty) {
      // When you open your app first time
      boxMainMovie.add(movieData);
      mainModel = boxMainMovie.get(0);
    } else {
      // Every time when add any data
      mainModel = boxMainMovie.get(0);
      // Refresh of data
      if(mainModel.results.isNotEmpty) {
        // Check if elements are repeating : List -> HashSet
        mainModel.results.toSet().addAll(movieData.results);
      } else {
        // results in db are empty
        mainModel.results.addAll(movieData.results);
      }
    }
    await boxMainMovie.put(hiveMainBoxName, mainModel);
  }

  addItemIntoMainBox(Movie movie) async{
    // Fetch previous model(first entry) and then store complete list
    var mainModel = boxMainMovie.get(0);
    mainModel?.result.add(movie);
    await boxMainMovie.put(hiveMainBoxName, mainModel);
  }

  // delete operation
  deleteItemFromMainBox(Movie movie) async {
    MovieData mainModel = boxMainMovie.get(0);
    mainModel?.results.toList().removeWhere((item) => item == movie);
    await boxMainMovie.put(hiveMainBoxName, mainModel);
  }

  // Fetch data
  Future<List<Movie>> loadItemsFromMainBox() async {
    MovieData mainModel = boxMainMovie.get(0);
    return mainModel.results ?? [];
  }

  Future<int> loadItemsCount() async {
    MovieData mainModel = boxMainMovie.get(0);
    return mainModel.results.length;
  }




}