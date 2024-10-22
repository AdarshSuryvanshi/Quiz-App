import 'package:flutter/material.dart';
// for that questions list which i have provided i am importing that file

class AnswerButton
    extends StatelessWidget // Hence we do not want to change any internal data in inbutton use statelessWidget here
{
  // As we have learn in previous steps make custome widgets in another file..like we are sending parametrs for answer_button from here and call answerButton()in Question file..Sending parametr from here and receving Data from there
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;
  @override
  Widget build(
      context) //  Here whatecer stylinh we want here we can do here just call the no.of i want in that page .... for exampl: In that Question page i have all AnsButton() 3 times.. thatmeans 3 butoons will go from here
  {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
            // padding here we are using for giving some space between widget and inside widget bewteen words anyehere .. By using padding we can give spacing anywhere........ Another way of giving space is by SizedBox(height =30)
            vertical: 10,
            horizontal: 40),
        backgroundColor: const Color.fromARGB(235, 32, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
          answerText, textAlign: TextAlign.center), // As beacuse we are using one button here but calling same button for multile answers...so we passing only ansText instead of ('Answer 1' or 2 or 3 like that) string String outside the widget
    ); // AS we are Receving All the Text ('Answer 1' or 2 or 3 like that).... While sending parameter
  }
}
