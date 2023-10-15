import 'dart:io';
import 'functions.dart';

String? numChoice;
void mainMenu() {
   print("Enter your name:");
  var numChoice = stdin.readLineSync();
  print("Welcome, $numChoice in library -_-");
   print("======================\n");
  print("Select choice you want:");
  print("======================\n");

  while (true) {
    print("1:Display all books");
    print("2:Search for books by id Or title Or category Or author");
    print("3:Add new book");
    print("4:Delete Book");
    print("5:Buy a Book");
    print("6:Print an invoice");
    print("7:Update book information");
    print("8:Display all book categories");
    print("E:Exit");

    numChoice = stdin.readLineSync();

    if (numChoice == "1") {
      displayAllBook();
    }
    if (numChoice == "2") {
      print("Enter id Or title Or category Or author To search for a book:");
      numChoice = stdin.readLineSync();
      searchBooks(numChoice!);
    }
    if (numChoice == '3') {
      print("Enter Book Id:");
      var addId = stdin.readLineSync();
      print("Enter Book title:");
      var addTitle = stdin.readLineSync();
      print("Enter Book category:");
      var addCategory = stdin.readLineSync();
      print("Enter Book author:");
      var addAuthor = stdin.readLineSync();
      print("Enter Book copies:");
      var addCopies = int.parse(stdin.readLineSync()!);
      print("Enter Book price");    
      var addPrice = double.parse(stdin.readLineSync()!);
      addNewBook(addId!,addTitle!,addCategory!,addAuthor!,addCopies,addPrice);
    }
    if (numChoice == '4') {
      print("Enter title To delete a book:");
      var numChoice = stdin.readLineSync();
      deleteBook(numChoice!);
    }
    if (numChoice == '5') {
      displayAllBook();
      print("What book do you want to buy?");
      numChoice = stdin.readLineSync();
      print("How many copies do you want?");
      var copiesNum = int.parse(stdin.readLineSync()!);
      buyBook(numChoice!,copiesNum);

    }
    if (numChoice == '6') {
      printInvoice();
    }
    if(numChoice == '7'){
      print("What book do you want to edit?");
      displayAllBook();
      print("Enter old Book Name:");
      var titleOld=stdin.readLineSync();
      print("Enter New Book Name:");
      var titleUpdate = stdin.readLineSync();
      print("Enter New Book Author:");
       var authorUpdate = stdin.readLineSync();
       print("Enter New Book Price:");
       var priceUpdate = double.parse(stdin.readLineSync()!);
      updateBookInformation(titleOld!,titleUpdate!,authorUpdate!,priceUpdate);
    }
    if(numChoice=='8'){

      displayAllBookCategories();
    }
    if (numChoice == 'E') {
      exit(0);
    }
  }
}