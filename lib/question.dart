// So we have created already questions blueprint contains a method and also a parameters     and we have also created a file contains All questions and there respective solutions

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer)
      onSelectAnswer; // Here we have created a function which will be triggrered on selecting any particular answer
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
// To change the Question Screen or Current Screen once we select any particular ans ... after selecting any particular Question next Question schould be displayed for that ....

  var currentQuestionIndex =
      0; // Here we have declare one variable Which Stores index of question ( in terms of integer )... which currently display on screen.. But After selecting any answer in that particular screen This .. this varaile schould be incremented Accordingly
  // For that we are creating one method which will increse currentQuestionIndex after selecting ans on given screen
  // ignore: non_constant_identifier_names
  void answerQuestion(String SelectedAnswer) {
// By This methos Whenever Ans is get selected next Question will ipdated on the screen

    // So since we have craeted a function  which will be triggrered on selecting any particular answer. But that we have created in Widget class   its now time to Access all that properties in State class.. That's why we have sended our "onSelectAnswer" as a parameter to the function AnswerQuestion();
    widget.onSelectAnswer(SelectedAnswer);

    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[
        currentQuestionIndex]; // Here i am accesing 1st Question in my List or you can say Initializing the currentQuestion with the 1st question
    // as we want All the images and boxes in a vertical order we are here to used Column widget wrap all that widgets inside and inside like that
    return SizedBox(
      width: double
          .infinity, // By using this command shade/colour will spread  and  cover All the screen as much as possible .. we can also spread screen by using width:100 or 200 or 300 acoordinf to user demand but by using this double.infinity screen will spreead as much as possible till infinity

      // for All texts should be in Centre we can wrap with Centre Widget but as a second option without using Center widget we can use  mainAxisAlignment: MainAxisAlignment.center

      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Use for all Boxes and widgets in a vartical Alignment and in Center
          // All vertical images and boxes should wrap up insidea a children
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion
                  .text, // All that text where my Questions are stored here

              style: GoogleFonts
                  .lato // Here we have added one third party package "Google fonts" for various fonts in my text ...... you can use it anywhere by just importing the package .. but as of now i am using in this in this particular text only ..This package will provide you Large amount of methods and Contructor functions . in that i am using this lato method
                  // So basically Lato is font Which we are using here
                  (
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, //
            ), // 1st write one text at top is .... By adding  more parametrs rather then text we can modify the given text
            const SizedBox(
                height:
                    30), // Then Sizedbox is used here is to give Spaces  here between next box or widget and Text

            // Here we have build one custome widget for buttons because ..  it is not good pratice to do same changes 3 times contatntly beacuse we have use 3 buttons so ... we are making one custome widgets and Calling that one widget as much buttons we have

            // Here i am calling this AnsButton() section Because If i am used that prevoius method that i have show below then.... It is difficult for me to reassigned and customized the button or decorate the button , so i choose to make another file call that file while sending parameters from here and Do all changes there in that file and just call here  //   that much time how many buttons i want

            // The goal now is to generate these answer buttons here dynamically based on the actual amount of answers that we have for the current questionnow we must convert these strings to widgets,so to say, to widgets that then use these strings.And such a conversion can be done by using Dart's built-in map method

            //Map allows you to convert, to transform you could say the values in a list to other values
            //The Map widget in Flutter is used for transforming and displaying key-value pairs dynamically in the UI. It allows efficient data manipulation and presentation.

            ...currentQuestion.getShuffledAnswers().map(
                // Here Instead of using   ...currentQuestion.answers.map((answer)  this Without shuffle Answer string We are using a string which is shuffle..... Use of shuffling answers is .. do not place a correct answer at top

                (answer)

                // By using this map widget We have stored all the Buttons Dyanamically so By this method we donot want to make separe ,ethod for evry buuton IT basically stored data and information of Every button Dyanamicaaly
                {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  } //  Here we have Write answerQuestion after OnTap ...... Because after selecting the Answer for current Question .. This methos will call and next question will Genrated on screen
                  );
            }), // Actually here code here inside this anonymous function does not execute immediately when this button is created,but only when this anonymous function is  triggred from inside to outside
            // Here this Anonomus fuction is get call get ans is get selected then .. Inside this anonomus function .. AnswerQuestion is get call which will furthur ..Stored that particular Selected answer in List of selected answer... So that every ans is get stored in List

            // What we have do above We have stored all the Buttons Dyanamically so By this method we donot want to make separe ,Method for evry buuton IT basically stored data and information of Every button Dyanamicaaly
            // ""..."" THIS 3 DOTS CALLED AS SPREDING VALUES:- eXPAIN IN NOTEBOOK

            // PREVIOUS APPROACH FOR MAKING BUTTONS AND STORED
            /*  AnswerButton(
              answerText:
                  currentQuestion.answers[0], //Sending 1st question in list
              onTap: () {},
            ),
            AnswerButton(
              answerText:
                  currentQuestion.answers[1], // Sending 2nd Question in list
              onTap: () {},
            ),
            AnswerButton(
              answerText:
                  currentQuestion.answers[2], // Sending 3 rd questing in list
              onTap: () {},
            ),
            AnswerButton(
              answerText:
                  currentQuestion.answers[3], // Sending 4th Question in list
              onTap: () {},
            ),*/

            /*  PREVIOUS METHOD
             ElevatedButton(
              onPressed: () {},
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Answer 3'),
            ),*/
          ],
        ),
      ),
    );
  }
}
