import 'package:js/js.dart';

@JS("Promise")
class Promise {
  external Object then(Function onFulfilled, Function onRejected);
  external static Promise resolve(dynamic value);
}

@JS("TestClass")
class TestClass {
  external factory TestClass(dynamic file, dynamic name);
}

@JS("TestTwo")
class TestTwo {
  external factory TestTwo(dynamic file);
}
