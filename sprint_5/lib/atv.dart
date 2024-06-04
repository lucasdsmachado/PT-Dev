import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text('Flutter: Primeiros Passos'),
              backgroundColor: Colors.blue,
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          body: const Column(
            children: [
              ThreeColors(Colors.white, Colors.pink, Colors.blue),
              ThreeColors(Colors.pinkAccent, Colors.purple, Colors.cyanAccent),
              ThreeColors(Colors.pink, Colors.amber, Colors.lightBlue),
              ThreeColors(
                  Colors.purpleAccent, Colors.white, Colors.greenAccent),
            ],
          ),
        ));
  }
}

class ThreeColors extends StatelessWidget {
  final Color _color1;
  final Color _color2;
  final Color _color3;

  const ThreeColors(this._color1, this._color2, this._color3, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _color1,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                color: _color2,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 150,
              child: const Icon(
                Icons.supervisor_account_rounded,
                color: Colors.black26,
                size: 25,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: _color3,
                border: Border.all(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
