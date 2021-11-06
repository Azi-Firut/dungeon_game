import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dungeon Slayer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var way = 'Welcome to dungeon';
  var roomDesc = '';

  moveLeft() {
    if (posX <= 359) {
      posX = posX + 35;
      room("");
    } else {
      roomDesc = 'You can\'t get through here, the walls are ahead!';
    }
  }

  moveRight() {
    if (posX > 11) {
      posX = posX - 35;
      room("");
    } else {
      roomDesc = 'You can\'t get through here, the walls are ahead!';
    }
  }

  moveUp() {
    if (posY <= 240) {
      posY = posY + 35;
      room("");
    } else {
      roomDesc = 'You can\'t get through here, the walls are ahead!';
    }
  }

  moveDown() {
    if (posY >= 21) {
      posY = posY - 35;
      room("");
    } else {
      roomDesc = 'You can\'t get through here, the walls are ahead!';
    }
  }

  String room(roomDesc) {
    if (descriptionsList.isNotEmpty) {
      var description = Random().nextInt(descriptionsList.length);
      descriptionsList[description];
      this.roomDesc = descriptionsList[description];
      descriptionsList.removeAt(description);
      return this.roomDesc;
    } else if (descriptionsList.isEmpty) {
      this.roomDesc = "You won, the dungeon is empty. Go home now";
    }
    return this.roomDesc;
  }

  void wayUserGo(way) {
    setState(() {
      way = way;
      // roomDesc = roomDesc;
    });
  }

  var posX = 185.0;
  var posY = 140.0;

  heroPositionX(posX) {
    this.posX;
    return posX;
  }

  heroPositionY(posY) {
    this.posY;
    return posY;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 306,
                width: 410,
                child: Stack(children: [
                  Image.asset(
                    "assets/dungeon.png",
                    height: 306,
                    // width: 410,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                      bottom: heroPositionY.call(posY),
                      right: heroPositionX.call(posX),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: FloatingActionButton(
                          backgroundColor: Colors.black38,
                          onPressed: () {},
                          child: const Icon(
                            Icons.directions_walk,
                            size: 30,
                          ),
                        ),
                      )),
                ]),
              ),
              Positioned(
                top: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, right: 10, left: 10),
                  child: Text(
                    '$way\n$roomDesc ',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Choice way to go',
                ),
              ),
              Expanded(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  FloatingActionButton(
                    onPressed: () {
                      way = 'You go north';
                      moveUp();
                      wayUserGo(way);
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      size: 50,
                    ),
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            way = 'You go west';
                            moveLeft();
                            wayUserGo(way);
                          },
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            size: 50,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            way = 'You go east';
                            moveRight();
                            wayUserGo(way);
                          },
                          child:
                              const Icon(Icons.keyboard_arrow_right, size: 50),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100,
                    child: FloatingActionButton(
                      onPressed: () {
                        way = 'You go south';
                        moveDown();
                        wayUserGo(way);
                      },
                      child: const Icon(Icons.keyboard_arrow_down, size: 50),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const SizedBox(
                                width: 120,
                              ),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 3.0, color: Colors.lightBlueAccent),
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                                onSurface: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const SizedBox(
                                width: 120,
                              ),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 3.0, color: Colors.lightBlueAccent),
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                                onSurface: Colors.orangeAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
