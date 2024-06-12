import 'package:flutter/material.dart';
import 'package:nosso_primeiro_app/data/task_inherited.dart';
import 'package:nosso_primeiro_app/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
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
            ),
            toolbarHeight: 80,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: -1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: TaskInherited.of(context)!.totalLevel() /
                              TaskInherited.of(context)!.taskList.length /
                              100,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.greenAccent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Level: ${TaskInherited.of(context)!.totalLevel() / 10}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: Colors.blueAccent,
                            fixedSize: Size(2, 2)),
                        child: const Icon(
                          Icons.refresh,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(context)!.taskList,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (contextNew) => FormScreen(taskContext: context)));
          },
          child: Icon(Icons.add),
        ));
  }
}
