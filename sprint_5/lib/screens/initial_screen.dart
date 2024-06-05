import 'package:flutter/material.dart';
import 'package:nosso_primeiro_app/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Container(),
            title: const Text('Tarefas'),
            backgroundColor: Colors.blue,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        body: AnimatedOpacity(
          opacity: opacity ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          child: ListView(children: const [
            Task('Aprender Flutter', 'assets/images/flutter.png', 3),
            Task('Andar de Bike', 'assets/images/bike.avif', 2),
            Task('Meditar', 'assets/images/meditation.jpeg', 5),
            Task('Ler', 'assets/images/read.jpg', 4),
            Task('Jogar', 'assets/images/play.jpg', 1),
            SizedBox(
              height: 80,
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: const Icon(Icons.remove_red_eye_outlined),
        ));
  }
}
