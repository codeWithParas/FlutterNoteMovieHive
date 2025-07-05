

import 'package:flutter_jan_batch/notepad/model/NoteModel.dart';

void main(){
  // Dart For Loops
  dartForLoopsExample();

  // Dart While Loops
  //dartWhileLoops();

  // Break and Continue
  //breakAndContinue();

  /*var logger = Logger('UI');
  logger.log('Button Clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);*/

  // NotePad

  Note('Eat', 'Healthy Food', '5 July');
  Note('Eat', 'Healthy Food', '5 July');

  var tv = SmartTelevision();
  tv.turnOn();
}

void notePadRecord(){
  var notes = {
    Note('Eat', 'Healthy Food', '5 July'),
    Note('Drink', 'Healthy Drink', '5 July'),
    Note('Travel', 'Travel to Delhi', '6 July'),
    Note('Homework', 'Work', '7 July'),
    Note('Workout', 'Gym', '8 July'),
  };

  var x = notes.elementAt(0).title;
}

class Note {

  int? _id;
  String _title = "";
  String _description = "";
  String _date = "";

  // Constructor
  Note(this._title, this._description, this._date);

  // Getter
  int? get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;

  // Setters
  set title(String newTitle) {
    this._title = newTitle;
  }
  set description(String newDesc) {
    this._description = newDesc;
  }
  set date(String newDate) {
    this._date = newDate;
  }
}

void breakAndContinue() {
  //Use break to stop looping:
  /*while (true) {
    if (shutDownRequested()) break;
    processIncomingRequests();
  }*/

  //Use continue to skip to the next loop iteration:
  /*for (int i = 0; i < candidates.length; i++) {
    var candidate = candidates[i];
    if (candidate.yearsExperience < 5) {
      continue;
    }
    candidate.interview();
  }*/

  //Use continue to skip to the next loop iteration:
  for (int i = 0; i < 5; i++) {
    if (i == 2) {
      continue;
    }
    print("Test  -  $i");
  }
}

void dartWhileLoops() {
  /*while (!isDone()) {
    doSomething();
  }*/
  /*do {
    printLine();
  } while (!atEndOfPage());*/
}

void dartForLoopsExample() {
  //1)
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);

  //2
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print("Callback - $i"));
  }
  for (final c in callbacks) {
    c();
  }

  //3
  var collection = [1, 2, 3];
  collection.forEach(print);
}

// Named Constructor
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  double x;
  double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = xOrigin, y = yOrigin;
}

// Immutable Constructor
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

abstract class Doer {
  // Define instance variables and methods...
  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}

class Television {
  void turnOn() {
    print("turn On old tv");
  }
}

class SmartTelevision extends Television {
  void turnOn() {
    //super.turnOn();
    print("turn On New tv");
  }
}