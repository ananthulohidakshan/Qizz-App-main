import 'package:dependency/database.dart';
import 'package:dependency/score.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {
  int? ans;
  int? value;
  int Quescount = 0;
  int QuesNo = 0;
  int rAns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 250, 250),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 216, 255, 24),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 90),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ?",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Color.fromARGB(255, 1, 1, 1)),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "${QuesNo + 1}/10",
                        style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      DataBase.quizData[QuesNo]['question'],
                      style: TextStyle(
                          fontSize: 18, height: 1.5, color: Color.fromARGB(255, 7, 7, 7)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              value = index;
                              value == DataBase.quizData[QuesNo]['answer']
                                  ? rAns++
                                  : print(value);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20, top: 10, bottom: 10, right: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color.fromARGB(255, 9, 9, 9)),
                                color: value == index
                                    ? value ==
                                            DataBase.quizData[QuesNo]['answer']
                                        ? const Color.fromARGB(255, 3, 248, 11)
                                        : Colors.red
                                    : Colors.transparent
                                // Changed the comparison
                                ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .50,
                                  child: Text(
                                    DataBase.quizData[QuesNo]['options'][index],
                                    style: TextStyle(
                                        fontSize: 18, color: const Color.fromARGB(255, 10, 10, 10)),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Color.fromARGB(255, 247, 247, 241),
                                    child: value == index
                                        ? value ==
                                                DataBase.quizData[QuesNo]
                                                    ['answer']
                                            ? Icon(Icons.done)
                                            : Icon(Icons.close)
                                        : SizedBox(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        QuesNo++;
                        value = 5;
                        Quescount++;

                        Quescount > 9
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Score(ans: rAns),
                                ))
                            : SizedBox();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 87, 44, 242),
                      ),
                      width: 150,
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 238, 238),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
            //   value == DataBase.quizData[QuesNo]['answer']
            //       ? Positioned(
            //           left: 0,
            //           right: 0,
            //           top: 0,
            //           bottom: 0,
            //           child: Center(
            //             child: Text("Nice"),
            //           ),
            //         )
            //       : SizedBox()
          ],
        ),
      ),
    );
  }
}

class CricleAvatar {
}
