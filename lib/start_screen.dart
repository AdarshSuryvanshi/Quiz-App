import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      this.switchScreen, // switchScreen() is a  positional argument in this round bracket only that contains a "Function()" as a value....... where void is the return type for that function ............ that is here we are using Functions as Argument Values
      {super.key});

  // But the positional argument (switchScreen..) which we have accepted in constructor function this will not used in the build() method so we cannot connect our button where we should want to coneect...... to solving that problem  here we declare a this switchScreen() argument as final... so that use anyWhere in build method

  final void Function()
      switchScreen; // Here switchScreen is declare as a varaible

  @override
  Widget build(context) {
    // By doing right click and click on Refractor Then We could have that access to wrap our widget with any another widget
    // Because here i want a  Box should be created in vertical manner I am using A parent widget Column (). for printing All vertical boxes in UI.. Because i want All boxes Should wrap inside and inside This i can do with Column
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // , the widget will only take up as much space as its children require, rather than filling all available space. Jitna chahiye utna hi space lega

        // Column wants a children argument,an argument named children So we create a list with square brackets , and in there we identifying all the widgets

        children: [
          Opacity(
            opacity: 0.5, // do not use Opcity more avoid if you can avoided
            child: Image.asset(
              'assets/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(148, 255, 255, 255),
            ),
          ), // image using an Image widget, you can load an image from various sources like assets, Also width is used to Shrinked the Image

          const SizedBox(
              height:
                  80), // The there is no gap between my Omage and Text .. So one of the way how make a gap By vreating one SizedBox().. Between them

          // Yes so here I want to print a text below My Image so i am Making one text widget below My image widget
          Text(
            'Learn Flutter Here',
            style: GoogleFonts
                .lato // Here we have added one third party package "Google fonts" for various fonts in my text ...... you can use it anywhere by just importing the package .. but as of now i am using in this in this particular text only ..This package will provide you Large amount of methods and Contructor functions . in that i am using this lato method
                // So basically Lato is font Which we are using here
                (
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // After my Text i want a gap between my Text and Button so i am creating one Sizebox() here
          const SizedBox(height: 30),
          // Now here i want a Button After the text To Start my Quiz........
          OutlinedButton.icon(
            // Here we are using our Button with icons . Child-> label ......... Buttons icon cannot read child read label only...

            onPressed:
                switchScreen, // This argument contains this folowing function
            /* () {
                switchScreen();
              },*/
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 Now Whatever the content I have written here It will give me output as What shuld implement on screen...... that is Text and boxes and images All content on screen for "User interface " I'll write on this page....
 Beause of this page user see some images and boxes and some texts on screen ............. Otherwise Quiz widget will only give me sreen
Column(
        mainAxisSize: MainAxisSize
            .min, // , the widget will only take up as much space as its children require, rather than filling all available space. Jitna chahiye utna hi space lega

        // Column wants a children argument,an argument named children So we create a list with square brackets , and in there we identifying all the widgets

        children: [
          Opacity(
            opacity: 0.5, // do not use Opcity more avoid if you can avoided
            child: Image.asset(
              'assets/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(148, 255, 255, 255),
            ),
          ), // image using an Image widget, you can load an image from various sources like assets, Also width is used to Shrinked the Image

          const SizedBox(
              height:
                  80), // The there is no gap between my Omage and Text .. So one of the way how make a gap By vreating one SizedBox().. Between them

          // Yes so here I want to print a text below My Image so i am Making one text widget below My image widget
          const Text(
            'Learn Flutter Here',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          // After my Text i want a gap between my Text and Button so i am creating one Sizebox() here
          const SizedBox(height: 30),
          // Now here i want a Button After the text To Start my Quiz........
          OutlinedButton.icon(
              // Here we are using our Button with icons . Child-> label ......... Buttons icon cannot read child read label only...
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),*/
