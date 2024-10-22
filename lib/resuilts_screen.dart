// This Result_screen will simply Display All the  Selected Answers of available Questions Respectively...with provide Numbering And also Give option to start the Quiz again

import 'package:flutter/material.dart';
import 'package:quiz_app/questio_summry.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResuiltsScreen extends StatelessWidget {
  // This Custome Widget Will defenetly not changing Any data Internally So thats why we creating as StatelessWidget
  const ResuiltsScreen({
    super.key,
    required this.chosenAnwers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String>
      chosenAnwers; // When we creating any List need to create its Positional Arguments or named Arguments ..... As Named arguments we write Inside {} curly brackets

  // MAPS :- map can simply be used as a data structure that groups different kinds of key value pairs together. There is no restriction in Map that if i'm usimg int as my Key my value schould be a Integer Like this.. There is no any Restriction.... We can Use Any keys for Any values

// String is Key...But value could be anything so Since all values in Dart are objects in the end,

  List<Map<String, Object>>
      getSummaryData() // Here in this  getSummaryData () Method ... We get the All the data Quiz Which is given by user right now .... In that will have Questions and its each Selected answers  Also Numbers Accordingly
  {
    // ignore: non_constant_identifier_names
    final List<Map<String, Object>> Summary = [];
    //Here We have created a Varaible of name Summary.. of data Type  " List<Map<String, Object>>" Now after This ...

    // Here we are using For loop ... To print 4 things Simualtaneoulsy ..  in Every iterations .. There is 1) Question NO. 2) QUestion 3) Correct  Answer  4) Answer selected By user......... This 4 things will print in a Bunch for every Iterations

    for (var i = 0; i < chosenAnwers.length; i++) {
      Summary.add({
        'question_index': i, // It will print the Question No Accordingly
        'question':
            questions[i].text, // Print the Actual Questions Accordig to index
        'correct_answer': questions[i].answers[
            0], //............... Now Here we have use answers.[0]...........because.... Becoz the Original(Not shuffled )  Answers Optional List  that we have prepared There no the 1st option we have placed correct Answer
        'user_answer': chosenAnwers[
            i] // answer which is choose  by user For that PArticular Question
      });
    }
    return Summary;
  }

  @override
  Widget build(context) {
    // Now Result Screen kai uper[ Total Kitne Questions hai and  user ne kitne questions correct kiye yai ] yai dispaly karne ke liye we are going to write some statements below

    final summaryData =
        getSummaryData(); // Here we are created one summaryData Where All imp data About the Quiz is stored.......... Here return type is fixed/Assigned According to data you stored or Assigned
    final numTotalQuestions = questions
        .length; // Jinte total no of Questions hai unko count karne ke liye we used questions.length
    final numCorrectQuestions = summaryData.where((data) {
      // To find out Questions whose answer is correctly selected by User..... so that total no of correctly attemted Questions we are counted here Dynamically
      return data['user_answer'] == data['correct_answer'];
    }).length;
// So here  If (user_answer == correct_answer) that data will be counted as 1 per Question .... and that data will be counted in integre so length
// Basically my logic here is user_answer in this i have Given Shuffled answer list  and Correct_answer in this i have given Oroginal Answer list   Where all the correct answer i have place at the 0th index of each multiple answer index........... So if for any particular Question for eg: answer selected by user and answer which is at the 0th index of the answer list id same ......... then "IF" condition is satisfied
    // Since If condition is satisfied..... It will be added to length.. hence length of Total correctQuestions will be increadsed by 1

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answersd $numTotalQuestions out of $numCorrectQuestions Questions Correctly ',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ), // If i have Repalce this statement ("You answersd X out of Y Questions Correctly ') with this ("You answersd $numTotalQuestions out of $numCorrectQuestions Questions Correctly "")
            const SizedBox(
              // i have just Repalce X and Y with a hard code Concrete Number of X and Y
              height: 30,
            ), // To give some space between This above text and below text
            QuestionSumarry(
              summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!!'),

              // This In this TextButton There is two parameters one .. ..1)Onpressed :- Will tell you what actions and what thing you have to do After pressing the button.... 2) child :- Will Tel you what Text() you print on the button

              // Here in this Button Text on the button is " Restart quiz" and when we pressed the button Then Quiz will Restart agin..
            ),
          ],
        ),
      ),
    );
  }
}
