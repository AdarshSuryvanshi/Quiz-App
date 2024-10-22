import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionSumarry extends StatelessWidget {
  const QuestionSumarry(
      this.sumarryData, // When I call QuestionSummary() in Resultscreen also send one Parameter along that i.e(getSummaryData()).......at Line no 80,,, That Parametr will accept here as Posotional Parameter
      {super.key});

  final List<Map<String, Object>> sumarryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          400, // Fixed the sized of the Box ... the content or the widgets beyond and more then the box will be Scroolable by Singlescroolableview() widget
      child: SingleChildScrollView(
        // This Widget is the reason behind the scrolable of content on the Deployment
        child: Column(
          children: sumarryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}


/*Row(
              children: [
                Text(((data['question_index'] as int) + 1)
                    .toString()), // Basically Here you know we set String as our Key.. So To acces Numbering Respectively According to Question .. We written "[question_index]" which has store an integer  Now . To typecaste the given String into an integer we used a spaicial keyword in dart i.e "as"
                // "as"  Will tell user knows More then the dart .. us to Typecaste the string and (+1) use bcoz .. in Result screen we Initialize indexing from 0 so that's why here we do +1 so that .. Numbering and indexing starts from 1

                Expanded(
                  // I have Expalin this widget "EXpanded" in notes see there for more deatails
                  child: Column(
                    children: [
                      Text(data['question']
                          as String), // Print the Actual Questions Accordig to index
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer']
                          as String), // Print the answer which is choose  by user For that PArticular Question
                      Text(data['correct_answer']
                          as String), //Print the Correct the ANswer Of that perticular Question
                    ],*/