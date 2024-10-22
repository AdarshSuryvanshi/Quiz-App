// THIS FILE WILL NOT CONTAINS ANY WIDGET , BUT IT WILL CONTAINS OBJECTS ...AS WE ALL KNOW OBJECTS ARE ALSO A DATA STRUCTURES CONTAINING SOME DATA..Here in this class we are storing .. Questions as text and Storing multiple ans in List

class QuizQuestion // Here no need of extends keyword because ..QuizQuestion is not a child of any class .... It itself a blueprint
{
  // Create a method and send 2 parameters here Questions in one and it's multiple answers in second

  QuizQuestion(this.text, this.answers);
  final String text; // This  String will contains Question
  final List<String>
      answers; // This list will contains multiple ans of that particular Question in terms of String .. thats why data type is String in that particular string .. List is just like an array .. Stores data of same data type...
//  LIST IS NOTHING BUT THE DYNAMIC ARRAYS

// Now If I want to change the Order of my List .. Dynamically then in that case I'll be using one built -in method in dart i.e "Shuffle()",

  List<String>
      getShuffledAnswers() // All the Shuffle() answers will stored un this list
  {
    final shuffledList = List.of( // Here List is not as a Data type .. It is also a Class
        answers); // Here We first make copy of Original answers List, Then we are going to Shuffle () the ans
    shuffledList
        .shuffle(); // Here Now the order of the Answer list will get change
    return shuffledList;
  }
}
