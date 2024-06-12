import 'package:flutter/material.dart';
import 'package:nosso_primeiro_app/components/difficult.dart';

class Task extends StatefulWidget {
  final String title;
  final String picture;
  final int difficult;

  Task(this.title, this.picture, this.difficult, {super.key});

  int level = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int maestry = 0;
  List<Color> maestryColors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.black,
  ];

  bool isPictureAsset() {
    if (widget.picture.contains('http')) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: maestryColors[maestry],
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
                          child: isPictureAsset()
                              ? Image.asset(
                                  widget.picture,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.picture,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                        'assets/images/nophoto.png');
                                  },
                                  fit: BoxFit.cover,
                                )),
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
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficult(
                          difficultLevel: widget.difficult,
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
                            if (widget.level / 10 >= widget.difficult &&
                                maestry < 6) {
                              setState(() {
                                maestry++;
                                widget.level = 0;
                              });
                            }
                            setState(() {
                              widget.level++;
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
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: widget.difficult > 0
                              ? ((widget.level / widget.difficult) / 10)
                              : 1,
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.greenAccent),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: ${widget.level}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
