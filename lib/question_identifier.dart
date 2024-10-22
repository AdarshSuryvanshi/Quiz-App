// This Custome Widget we are using for customized the each Question Number that Integer wrt individually ,

import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key, // Here this Questionidentifier class contains two parametr 1) isCorrectAnswer :- This we are using Specially to Color the number....Means the answer which user selected if that was a right answer for that Particular Question then on the Result Screen ...The number of that Question Color with " BLUE"
    // and if answer which user selected if that was a wrong answer for that Particular Question then on the Result Screen ...The number of that Question Color with "PINK"
    required this.isCorrectAnswer, // for this Purpose we are using "isCorrectAnswer";
    required this.questionIndex, //
  });
  final int questionIndex;
  final bool
      isCorrectAnswer; // To choose whether the color Which we have to give to the Question number is PINK OR BLUE . We are using bool data type here

  @override
  Widget build(context) {
    final questionNumber = questionIndex +
        1; // As my Quesion_number starts from 1 but indexing Starts from 0, so i That's why I write like this

    return Container // Because i want use Boxdecoration Widget inside the box ....that's why I start with Container widget instead of Sizebox().......... as we use prevously
        (
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 150, 198,
                241) // This are the two colors are there Which will be Around my number According to condition I have spacified Above
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(
            100), // This circular Borderradius 100 because .... It is my choice that I want a Circlr around my Number .......... As you wish give Radius acording to your wish
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
