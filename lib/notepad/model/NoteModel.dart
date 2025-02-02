


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

  // Object -> Map
  Map<String, dynamic> objectToMapConversion(){
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  // Map -> Object
  Note.mapToObjectConversion(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
  }
}