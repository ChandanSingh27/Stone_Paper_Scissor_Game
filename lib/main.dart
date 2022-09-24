import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Game());
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const GameLogic(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GameLogic extends StatefulWidget {
  const GameLogic({Key? key}) : super(key: key);

  @override
  State<GameLogic> createState() => _GameLogicState();
}

class _GameLogicState extends State<GameLogic> {
  Widget main() {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.topLeft,
              // color: Colors.yellowAccent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Computer : ",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                        Text(
                          "Score : $scoreOfComputer",
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(imageForComputer),
                      radius: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textToDisplayComputer,
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total Matches : $totalMatches",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "Draw Matches : $drawMatches",
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            )),
        const Divider(color: Colors.white,height: 1.0,thickness: 2,),
        // ############################# User Area Design and Logics #############################
        Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.topLeft,
              // color: check ? Colors.green : Colors.transparent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "User : ",
                          style: TextStyle(fontSize: 25.0, color: Colors.blue),
                        ),
                        Text(
                          "Score : $scoreOfUser",
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          totalMatches += 1;
                          randomNumberForUser = Random().nextInt(3);
                          if (randomNumberForUser == 0) {
                            imageForUser = "assets/images/paper.jpg";
                            textToDisplayUser = "Paper";
                          } else if (randomNumberForUser == 1) {
                            imageForUser = "assets/images/scissors.jpg";
                            textToDisplayUser = "Scissor";
                          } else {
                            imageForUser = "assets/images/stone.jpg";
                            textToDisplayUser = "Stone";
                          }
                          randomNumberForComputer = Random().nextInt(3);
                          if (randomNumberForComputer == 0) {
                            imageForComputer = "assets/images/paper.jpg";
                            textToDisplayComputer = "Paper";
                          } else if (randomNumberForComputer == 1) {
                            imageForComputer = "assets/images/scissors.jpg";
                            textToDisplayComputer = "Scissor";
                          } else {
                            imageForComputer = "assets/images/stone.jpg";
                            textToDisplayComputer = "Stone";
                          }
                        });
                        setState(() {
                          if (randomNumberForComputer == 0 &&
                              randomNumberForUser == 1) {
                            titleDisplay = "User Win";
                            scoreOfUser += 1;
                            // imageForUser = "assets/images/smile.png";
                            // imageForComputer = "assets/images/udhash.png";
                            check = true;
                          } else if (randomNumberForComputer == 1 &&
                              randomNumberForUser == 0) {
                            titleDisplay = "Computer Win";
                            scoreOfComputer += 1;
                            // imageForComputer = "assets/images/smile.png";
                            // imageForUser = "assets/images/udhash.png";
                            check = false;
                          } else if (randomNumberForComputer == 1 &&
                              randomNumberForUser == 2) {
                            titleDisplay = "User Win";
                            scoreOfUser += 1;
                            // imageForUser = "assets/images/smile.png";
                            // imageForComputer = "assets/images/udhash.png";
                            check = true;
                          } else if (randomNumberForComputer == 2 &&
                              randomNumberForUser == 1) {
                            titleDisplay = "Computer Win";
                            scoreOfComputer += 1;
                            // imageForComputer = "assets/images/smile.png";
                            // imageForUser = "assets/images/udhash.png";
                            check = false;
                          } else if (randomNumberForComputer == 0 &&
                              randomNumberForUser == 2) {
                            titleDisplay = "Computer Win";
                            scoreOfComputer += 1;
                            // imageForComputer = "assets/images/smile.png";
                            // imageForUser = "assets/images/udhash.png";
                            check = false;
                          } else if (randomNumberForComputer == 2 &&
                              randomNumberForUser == 0) {
                            titleDisplay = "User Win";
                            scoreOfUser += 1;
                            // imageForUser = "assets/images/smile.png";
                            // imageForComputer = "assets/images/udhash.png";
                            check = true;
                          } else {
                            drawMatches += 1;
                            titleDisplay = "Match Draw";
                            // imageForUser = "assets/images/udhash.png";
                            // imageForComputer = "assets/images/udhash.png";
                            check = false;
                          }
                        });
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(imageForUser),
                        radius: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      textToDisplayUser,
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  int scoreOfComputer = 0;
  int scoreOfUser = 0;
  int randomNumberForComputer = -1;
  int randomNumberForUser = -1;
  String imageForComputer = "assets/images/user.png";
  String imageForUser = "assets/images/user.png";
  String textToDisplayComputer = "";
  String textToDisplayUser = "";
  String titleDisplay = "Stone Paper Scissors Game";
  bool check = false;
  int totalMatches = 0;
  int drawMatches = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black26,
          title: Text(
            titleDisplay,
            style: const TextStyle(
              fontFamily: "cursive",
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          leading: totalMatches == 0
              ? null
              : IconButton(
                  icon: const Icon(Icons.restart_alt_sharp),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameLogic())),
                ),
          centerTitle: true,
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return main();
            } else {
              return Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.5,
                        alignment: Alignment.topLeft,
                        // color: Colors.yellowAccent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Computer : ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  Text(
                                    "Score : $scoreOfComputer",
                                    style: const TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(imageForComputer),
                                radius: 75,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                textToDisplayComputer,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Total Matches : $totalMatches",
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              Text(
                                "Draw Matches : $drawMatches",
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      )),
                   SizedBox(width: 2,child: Container(child: const Center(child: null),decoration: const BoxDecoration(color: Colors.white),)),
                  // const Divider(color: Colors.white,indent: 10.0,thickness: 40,endIndent: 10.0,),

                  // ############################# User Area Design and Logics #############################
                  Expanded(
                      flex: 1,
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.5,
                        alignment: Alignment.topLeft,
                        // color: check ? Colors.green : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 6),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "User : ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.blue),
                                  ),
                                  Text(
                                    "Score : $scoreOfUser",
                                    style: const TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    totalMatches += 1;
                                    randomNumberForUser = Random().nextInt(3);
                                    if (randomNumberForUser == 0) {
                                      imageForUser = "assets/images/paper.jpg";
                                      textToDisplayUser = "Paper";
                                    } else if (randomNumberForUser == 1) {
                                      imageForUser =
                                          "assets/images/scissors.jpg";
                                      textToDisplayUser = "Scissor";
                                    } else {
                                      imageForUser = "assets/images/stone.jpg";
                                      textToDisplayUser = "Stone";
                                    }
                                    randomNumberForComputer =
                                        Random().nextInt(3);
                                    if (randomNumberForComputer == 0) {
                                      imageForComputer =
                                          "assets/images/paper.jpg";
                                      textToDisplayComputer = "Paper";
                                    } else if (randomNumberForComputer == 1) {
                                      imageForComputer =
                                          "assets/images/scissors.jpg";
                                      textToDisplayComputer = "Scissor";
                                    } else {
                                      imageForComputer =
                                          "assets/images/stone.jpg";
                                      textToDisplayComputer = "Stone";
                                    }
                                  });
                                  setState(() {
                                    if (randomNumberForComputer == 0 &&
                                        randomNumberForUser == 1) {
                                      titleDisplay = "User Win";
                                      scoreOfUser += 1;
                                      // imageForUser = "assets/images/smile.png";
                                      // imageForComputer = "assets/images/udhash.png";
                                      check = true;
                                    } else if (randomNumberForComputer == 1 &&
                                        randomNumberForUser == 0) {
                                      titleDisplay = "Computer Win";
                                      scoreOfComputer += 1;
                                      // imageForComputer = "assets/images/smile.png";
                                      // imageForUser = "assets/images/udhash.png";
                                      check = false;
                                    } else if (randomNumberForComputer == 1 &&
                                        randomNumberForUser == 2) {
                                      titleDisplay = "User Win";
                                      scoreOfUser += 1;
                                      // imageForUser = "assets/images/smile.png";
                                      // imageForComputer = "assets/images/udhash.png";
                                      check = true;
                                    } else if (randomNumberForComputer == 2 &&
                                        randomNumberForUser == 1) {
                                      titleDisplay = "Computer Win";
                                      scoreOfComputer += 1;
                                      // imageForComputer = "assets/images/smile.png";
                                      // imageForUser = "assets/images/udhash.png";
                                      check = false;
                                    } else if (randomNumberForComputer == 0 &&
                                        randomNumberForUser == 2) {
                                      titleDisplay = "Computer Win";
                                      scoreOfComputer += 1;
                                      // imageForComputer = "assets/images/smile.png";
                                      // imageForUser = "assets/images/udhash.png";
                                      check = false;
                                    } else if (randomNumberForComputer == 2 &&
                                        randomNumberForUser == 0) {
                                      titleDisplay = "User Win";
                                      scoreOfUser += 1;
                                      // imageForUser = "assets/images/smile.png";
                                      // imageForComputer = "assets/images/udhash.png";
                                      check = true;
                                    } else {
                                      drawMatches += 1;
                                      titleDisplay = "Match Draw";
                                      // imageForUser = "assets/images/udhash.png";
                                      // imageForComputer = "assets/images/udhash.png";
                                      check = false;
                                    }
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(imageForUser),
                                  radius: 75,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                textToDisplayUser,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              );
            }
          },
        ));
  }
}
