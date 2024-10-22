// BEFORE STARTING ANY NEW PROJECT ALWAYS CHECK THAT YOUR GRADLE SHOULD BE COMPATIBLE WITH 8.9 IN GRADLE-WRAPPER.PRPERTIES IN ANDRIOID/GRADLE-WRAPPER 



import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(const Quiz());
}

// Here in main.dart file we call here Quiz file ....... Which Already containing All this data Which i had  written follow All this data Whill create and show automatically on UI screen When I create new screen
   // Here basically Instead of Writing all the data here in main file I have created another file name Quiz and transfer All the data there Basically created a Custome Widget
    /*MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(147, 7, 13, 200),
              ],
              begin: Alignment.topLeft, // positions a widget in the top-left corner of its parent container
              end: Alignment.bottomRight, //These alignments are useful for controlling widget placement within a container,
            ),
          ),
          child: const StartScreen(),
        ), // If I want to add screen to all screens in App .. make this screen child and also wrap all the containers above this
      ),
    ),*/
