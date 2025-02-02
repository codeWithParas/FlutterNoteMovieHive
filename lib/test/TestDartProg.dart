

int id = 10;
String? name;
late String data;
var value = 'Bob';

const String address = 'abc';
//List
var list = [1,2,3,4];
var listNames = ['Car', 'Boat', 'Plane'];

// Set
var chemicals = {'hydrogen', 'iodine', 'asdas', 'sdsdsd'};

// Map
var products = {
  // Key: Value
  'first': 'p1',
  'second': 12,
  'third': true,
  'fourth': 10.0,
};

var mainProduct = Map<String, dynamic>();

var callbacks = [];

void main(){

  //data = 'avbbndvf';
  //address = 'dffd';
  // call server - fetch product - - feed ui
  //data = null;

  mainProduct['first'] = 'p1';
  mainProduct['second'] = 12;
  mainProduct['third'] = true;

  print(mainProduct['second']);

  /*for(var i = 0; i<10; i++) {
    callbacks.add(() => print(i));
  }

  for(final c in callbacks) {
    c();
  }*/

  var p = Point(2,4);

  //var pCentre = Point.centre();

  var pAlongX = Point.alongXAxis(12);
}

// default
int xCentre = 0;
int yCentre = 0;

class Point {

  int x;
  int y;

  // Generative Constructor
  Point(this.x, this.y);

  // Named Constructor
  /*Point.centre()
    : x = xCentre,
      y = yCentre;*/

  // Constant Constructor
  //const Point(this.x, this.y);

  // Redirecting Constructor
  Point.alongXAxis(int x) : this(x, 0);
}