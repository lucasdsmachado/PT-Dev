void main() {
  // Future myFuture = Future((() {
  //   print('Going back to the Future');
  //   return 21;
  // })).then((value) => print('The value is $value'));

  // Future<int> myFutureFunc() async {
  //   print('I have a function in the Future');
  //   await Future.delayed(Duration(seconds: 5));
  //   throw Exception();
  //   return 12;
  // }

  // myFutureFunc()
  //     .then((value) => print('My function value is: $value'))
  //     .onError((error, stackTrace) => print('An Error ocurred'))
  //     .whenComplete(() => print('The future is Over'));

  Future<int> myFutureErrorFunc(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }

      print('I have a functional function');
      await Future.delayed(Duration(seconds: 5));
    } catch (e) {
      print('An error ocurred: $e');
    } finally {
      print('The Future is Finally Over');
    }

    return 42;
  }

  myFutureErrorFunc(2, 1).then((value) => print('The value is $value'));

  print('Done with main');
}
