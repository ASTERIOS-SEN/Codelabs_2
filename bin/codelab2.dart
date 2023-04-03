import 'package:codelab2/codelab2.dart' as codelab2;

/** String interpolation **/
String stringify(int x, int y) {
  return '$x $y';
}

/** Null-aware operators **/
void updateName(String? bar) {
  print(bar ??= 'Bob');
}

/** Conditional property access **/
String? upperCaseIt(String? str) {
  return str?.toUpperCase();
}

class MyClass {
  int value1 = 2;
  int value2 = 3;
  int value3 = 5;

  int get sum => value1 * value2 * value3;

  void incrementValues() => value1++;

  String joinWithCommas(List<String> strings) => strings.join(',');
}

/** Cascades **/
class BigObject {
  int anInt = 3;
  String aString = '';
  List<int> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  return BigObject()
    ..anInt = 1
    ..aString = 'hello'
    ..aList = [1, 2, 3]
    ..allDone();
}

/** Getters and setters **/

class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  double get totalPrice => _prices.reduce((value, element) => value + element);

  set totalPrice(double value) {
    if (value < 0) {
      throw InvalidPriceException();
    }
    _prices.add(value);
  }
}

/** Optional positional parameters **/
String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  var total = '$a';
  if (b != null) total += ', $b';
  if (c != null) total += ', $c';
  if (d != null) total += ', $d';
  if (e != null) total += ', $e';

  return total;
}

/** Named parameters **/
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old',
    this.aDouble = 2.0,
  });

  MyDataObject copyWith({
    int? anInt,
    String? aString,
    double? aDouble,
  }) {
    return MyDataObject(
      anInt: anInt ?? this.anInt,
      aString: aString ?? this.aString,
      aDouble: aDouble ?? this.aDouble,
    );
  }
}

/** Exceptions **/
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;

  const ExceptionWithMessage(this.message);
}

abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception catch (e) {
    logger.logException(e.runtimeType);
  } finally {
    logger.doneLogging();
  }
}

/** Using this in a constructor **/
class Myclass {
  final int anInt;
  final String aString;
  final double aDouble;

  Myclass(this.anInt, this.aString, this.aDouble);
}

void main() {
  /** String interpolation **/
  print(stringify(5, 2));

  /** Nullable variables **/
  String? name = 'Bob';
  String? name2;

  /** Null-aware operators **/
  String? foo = 'a string';
  String? bar; //null

  String? baz = foo ?? bar;

  updateName(bar);

  /** Conditional property access **/
  print(upperCaseIt("danny"));

  /** Collection literals **/
  // Assign this a list containing 'a', 'b', and 'c' in that order:
  final aListOfStrings = ['a', 'b', 'c'];

  // Assign this a set containing 3, 4, and 5:
  final aSetOfInts = {3, 4, 5};

  // Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
  final aMapOfStringsToInts = {'mikey': 12};

  // Assign this an empty List<double>:
  final anEmptyListOfDouble = <double>[];

  // Assign this an empty Set<String>:
  final anEmptySetOfString = <String>{};

  // Assign this an empty Map of double to int:
  final anEmptyMapOfDoublesToInts = <int, double>{};

  /** Arrow syntax **/
  var myClass = MyClass();

  print(myClass.sum);
  print(myClass.joinWithCommas(['a', 'b', 'c']));

  /** Cascade **/
  print(BigObject()._done);

  /** Getters and setters **/
  var cart = ShoppingCart();
  cart.totalPrice = 15.4;
  print(cart.totalPrice);

  /** Optional positional parameters **/
  print(joinWithCommas(1, 2, 3, 4, 5));

  /** Named parameters **/
  var object = new MyDataObject(aString: 'New');
  print(object.aString);

  /** Exceptions **/
  var log = ExceptionWithMessage;
  print(log);

  /** Type data **/
  var num = 10;
  print(num.runtimeType);

  /** Using this in a constructor **/
  var myclass = Myclass(1, 'operator this', 2.0);
  print(myclass.aString);

  /** Initializer lists **/
  
}
