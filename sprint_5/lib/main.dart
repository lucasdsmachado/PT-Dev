import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

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
                leading: Container(),
                title: Text('Tarefas'),
                backgroundColor: Colors.blue,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            body: AnimatedOpacity(
              opacity: opacity ? 1.0 : 0.0,
              duration: Duration(milliseconds: 800),
              child: ListView(children: const [
                Task(
                    'Aprender Flutter',
                    'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                    3),
                Task(
                    'Andar de Bike',
                    'https://images.unsplash.com/photo-1553105659-d918b253f0f2?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    2),
                Task(
                    'Meditar',
                    'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
                    5),
                Task(
                    'Ler',
                    'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg',
                    4),
                Task(
                    'Jogar',
                    'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
                    1),
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                setState(() {
                  opacity = !opacity;
                });
              },
              child: const Icon(Icons.remove_red_eye_outlined),
            )));
  }
}

class Task extends StatefulWidget {
  final String title;
  final String picture;
  final int dificulty;
  const Task(this.title, this.picture, this.dificulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.picture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: widget.dificulty >= 1
                                      ? Colors.blue
                                      : Colors.blue[100],
                                  size: 15),
                              Icon(Icons.star,
                                  color: widget.dificulty >= 2
                                      ? Colors.blue
                                      : Colors.blue[100],
                                  size: 15),
                              Icon(Icons.star,
                                  color: widget.dificulty >= 3
                                      ? Colors.blue
                                      : Colors.blue[100],
                                  size: 15),
                              Icon(Icons.star,
                                  color: widget.dificulty >= 4
                                      ? Colors.blue
                                      : Colors.blue[100],
                                  size: 15),
                              Icon(Icons.star,
                                  color: widget.dificulty >= 5
                                      ? Colors.blue
                                      : Colors.blue[100],
                                  size: 15),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 72,
                        width: 72,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: const ContinuousRectangleBorder(),
                              iconColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                level++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                    fontSize: 15,
                                    overflow: TextOverflow.fade,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                          width: 200,
                          child: LinearProgressIndicator(
                            value: widget.dificulty > 0
                                ? ((level / widget.dificulty) / 10)
                                : 1,
                            backgroundColor: Colors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.greenAccent),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nível: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
