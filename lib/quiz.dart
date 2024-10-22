import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/resuilts_screen.dart';

class Quiz extends StatefulWidget {
  // Here in this Quiz file I have stored All the data Which i wanted to be Show on every screen of my Application
  const Quiz(
      {super.key}); // Baically the screen which i want on every page ....... Here i have created only screen ....but  UI on screen will be in next file
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // If in case I want to create a Resultscreen ... Where Summary of All answers which i had selected in that Questiones is stored in that Result screen ..now in that case need to craete a list of All slected Answers .... and stored all that ans in List data Structres
  // ignore: non_constant_identifier_names
  List<String> SelectedAnswers = [];

  /// To stored All the slected answers in this list so that user get summary of his or her slected ans.. in ResultSCreen

  var activeScreen =
      'Start-Screen'; // Here we have stored our StartScreen Custome Widget as a object........ Active screen help us to change screen from Startscreen to Question screen

  void
      switchScreen() // basically when i call the function switchScreen()  then my screen will change from Startscreen() ---> QuestionScreen ....... because my activescreen then call QuestionScreen because it stores the Widget QuestionScreen() in switchScreen().............. Otherwise startscreen() will excute untill Switchscreen() is not gets call
  {
    setState(() {
      activeScreen = 'Question-Screen';
    });
  }

  // Here we have craeed one function that Whenever any answer is get selected then .. then This function which we have created below  is get call and that ans is get add in Selectedanswers List
  void chooseAnswer(String answer) {
    SelectedAnswers.add(
        answer); // After selecting any answer... This function will calll and Answer will stored in this SlectedAnswers  List

    // Once at that point we have reached... We get to know whether the we have answer all the  avilble Questions.. Once we have completed to add answer of the answers of availble Questions ... Then Directly Result summary should be open
    // To checked we have give Answers of availble Questions or not .. We used  "If"

    if (SelectedAnswers.length ==
        questions
            .length) // If Length(no of element ) of Questions List which is of String and Length of selected answers List which is also of String then We directly Switch ro Result_screen or Simaary _Screen
    {
      setState(() {
        // Since Now we have our Result Screen now so no need To Resert the Quiz after too early .... It schould be Resart after excuting of Result screen
        activeScreen =
            'Result-Screen'; // After the Selcting All the Answers of availble Qustions then this Result-Scren will Call
      });
    }
  }

  void restartQuiz() {
    setState(() {
      SelectedAnswers = [];
      activeScreen = 'Questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
        switchScreen); // At start (screenWidget =StartScreen) will excute but when switchscreen is call then (screenWidget = Question()) will excute

// Here i am coparing my current screen with String .... Which ever string is there that function will excute
    if (activeScreen == 'Question-Screen') {
      screenWidget = Question(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'Result-Screen') {
      // When My activescreen stores Result-Screen as a String then ... My Result-Screen should call
      screenWidget = ResuiltsScreen(
        chosenAnwers:
            SelectedAnswers, // Here in this resultScreen function we sending SelectedAnswers as a Value
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(147, 7, 13, 200),
              ],
              begin: Alignment
                  .topLeft, // positions a widget in the top-left corner of its parent container
              end: Alignment
                  .bottomRight, //These alignments are useful for controlling widget placement within a container,
            ),
          ),
          child: // chlild is a argument and it is only stores a Widget ....

              screenWidget, // This contains the current screen and run in build mehthod
        ), // If I want to add screen to all screens in App .. make this screen child and also wrap all the containers above this
      ),
    );
  }
}

/* This All content you are seeing here is basically the  "Screen" on which is provided by Scaffold .. Scaffold will only provide a normal screen You have to add color and decoration acoording to you 
This All content Is only a normal screeen...... Now i am calling a Startscreen file on there I have written the "User Interface :- i.e Baiscally all images and boxes i want on this normal screen" .. That i will design on StartScreen page file 
Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(147, 7, 13, 200),
              ],
              begin: Alignment
                  .topLeft, // positions a widget in the top-left corner of its parent container
              end: Alignment
                  .bottomRight, //These alignments are useful for controlling widget placement within a container,
            ),
          ),
          child:
              const StartScreen(), // In this Quiz file i'm calling my start screen
        ), // If I want to add screen to all screens in App .. make this screen child and also wrap all the containers above this



 ALTERNATIVE NO 1;


import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  // Here in this Quiz file I have stored All the data Which i wanted to be Show on every screen of my Application
  const Quiz(
      {super.key}); // Baically the screen which i want on every page ....... Here i have created only screen ....but  UI on screen will be in next file
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? // Here we apply Question mark because  " The ? tell Dart that the varaible may contai a awidget OR NULL"

      activeScreen; // Here we have stored our StartScreen Custome Widget as a object........ Active screen help us to change screen from Startscreen to Question screen

  // Because here i have to coneect both Startscreen() and switchScreen() so Thth's whyi'm sending swithscreen as a positional argument

  @override
  void
      initState() // initState() . This method we have used beacuse.. When ever we are using StatefulWidget... the deaclare varaible is start to runs once before the widget is displaying on the screen
  {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void
      switchScreen() // basically when i call the function switchScreen()  then my screen will change from Startscreen() ---> QuestionScreen ....... because my activescreen then call QuestionScreen because it stores the Widget QuestionScreen() in switchScreen().............. Otherwise startscreen() will excute untill Switchscreen() is not gets call
  {
    setState(() {
      activeScreen = const Question();
    });
  }


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(147, 7, 13, 200),
              ],
              begin: Alignment
                  .topLeft, // positions a widget in the top-left corner of its parent container
              end: Alignment
                  .bottomRight, //These alignments are useful for controlling widget placement within a container,
            ),
          ),
          child: // chlild is a argument and it is only stores a Widget ....

              activeScreen, // Instead of Calling StartScreen() ...... We could call activescreen because it is stores StartScreen() as a object

          // In this Quiz file i'm calling my start screen

        ), // If I want to add screen to all screens in App .. make this screen child and also wrap all the containers above this
      ),
    );
  }
}

ALTERNATIVE NO 2 ....... By ternary operators

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  // Here in this Quiz file I have stored All the data Which i wanted to be Show on every screen of my Application
  const Quiz(
      {super.key}); // Baically the screen which i want on every page ....... Here i have created only screen ....but  UI on screen will be in next file
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {


  var activescreen ='Start-Screen'; // Here  i am storing string intead any widget or function.... and i am going to check this string in build method 

  void  switchScreen() // basically when i call the function switchScreen()  then my screen will change from Startscreen() ---> QuestionScreen ....... because my activescreen then call QuestionScreen because it stores the Widget QuestionScreen() in switchScreen().............. Otherwise startscreen() will excute untill Switchscreen() is not gets call
  {
    setState(() {
      activeScreen = 'Question-Screen';
    });
  }


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(147, 7, 13, 200),
              ],
              begin: Alignment
                  .topLeft, // positions a widget in the top-left corner of its parent container
              end: Alignment
                  .bottomRight, //These alignments are useful for controlling widget placement within a container,
            ),
          ),
         // chlild is a argument and it is only stores a Widget ....

             child:  activeScreen == 'Start-screen'?StartScreen(switchScreen): Question(), ........... This i have writeen using concept of ternanry operators

              

        ), // If I want to add screen to all screens in App .. make this screen child and also wrap all the containers above this
      ),
    );
  }
}*/
