import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.blue,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.cyan,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.pinkAccent,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.purple,
                width: 50,
                height: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Hello World',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print('Button Pressed');
                }
              },
              child: const Text('Press Me'))
        ],
      ),
    );
  }
}