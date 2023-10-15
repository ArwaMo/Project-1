import 'dart:io';
import 'package:library_project/book.dart';
import 'package:library_project/cartItem.dart';
import 'package:library_project/bookLibrary.dart';

double sumBuyBook = 0.0;
List<Book> dataBooks = [];
List<CartItem> cart = [];

void loadAllData() {
  for (var element in books) {
    dataBooks.add(Book(
      id: element['id'],
      title: element['title'],
      category: element['category'],
      author: element['author'],
      copies: element['copies'],
      price: element['price'],
    ));
  }
}

void displayAllBook() {
  for (var element in dataBooks) {
    element.printBook();
  }
  print("======================\n");
}

void searchBooks(String inputUser) {
  List<Book> bookList = dataBooks
      .where((element) =>
          element.id == inputUser ||
          element.title == inputUser ||
          element.category == inputUser ||
          element.author == inputUser)
      .toList();
  bookList.forEach((element) {
    element.printBook();
  });
  print("======================\n");
}

void addNewBook(String id, String title, String category, String author,
    int copies, double price) {
  bool isFound = false;
  for (var element in dataBooks) {
    if (element.title == title) {
      isFound = true;
      element.copies += copies;
      print("The addition process was successful -_-");
      print("The number of books now is $copies");
    }
  }
  if (isFound == false)
    dataBooks.add(
      Book(
        id: id,
        title: title,
        category: category,
        author: author,
        copies: copies,
        price: price,
      ),
    );
  displayAllBook();
}

void deleteBook(String inputUser) {
  if (dataBooks.isEmpty)
    print('Library is Empty');
  else {
    var res = dataBooks.where((element) => element.title == inputUser);
    if (res.isEmpty)
      print('There is no book has title \' $inputUser \'');
    else {
      dataBooks.removeWhere((element) => element.copies == 1);
      for (var element in dataBooks) {
        if (element.title == inputUser && element.copies > 1) element.copies--;
       
      }
       print("Successful deletion");
    }
  }
  print("======================\n");
}

void buyBook(String inputUser, int copiesNum) {
  var res = dataBooks.where((element) => element.title == inputUser);
  if(res.isEmpty) {
    print('There is no book with title: \' $inputUser \'');
  }
  else{
    for (var element in dataBooks) {
      if (element.title == inputUser) {
        if(element.copies >= copiesNum){
        sumBuyBook = element.price * copiesNum;
        print("Your total purchases is :$sumBuyBook");
        int copiesSubtract = element.copies - copiesNum;
        print("$copiesSubtract copies remaining, Thank you for purchese -_- ");
        if(cart.where((e) => e.itemName == element.title).isEmpty)
          cart.add(CartItem(element.title,sumBuyBook));
        else{
          for(CartItem ci in cart){
            if(ci.itemName == element.title)
              ci.total += copiesNum;
          }
        }
        }
        else {
          print("The number of copies is insufficient");
        } 
      }
    }
  }
  print("======================\n");
}

void printInvoice() {
  double cost = 0;
  for(CartItem citem in cart){
    cost += citem.total;
    citem.displayItemData();
  }
  print('Total Cost: $cost');
}

void updateBookInformation(String oldTitle, String title, String author, double price) {
  bool isFound = false;
  for (var element in dataBooks) {
    if (element.title == oldTitle) {
      isFound = true;
      print("The Book before update ::");
      element.printBook();
      element.title = title;
      element.author = author;
      element.price = price;
      print("The Book after update ::");
      element.printBook();
    }
  }
  if(isFound == false) print("$oldTitle Not Found !");
}

void displayAllBookCategories(){

var categoryOnly=dataBooks.map((element) => element.category);
var categoryRemoveDuplicate=categoryOnly.toSet().toList();
print(categoryRemoveDuplicate);
print("======================\n");

      print("Select category:");
      print("======================\n");
      print("1:Education & Reference");
      print("2:History");
      print("3:Children's Books");
      var numChoice = stdin.readLineSync();
if(numChoice=='1'){
for (var element in dataBooks) {
 if(element.category=='Education & Reference'){
  element.printBook();
 }
}
}
if(numChoice=='2'){
  for (var element in dataBooks) {
 if(element.category=='History'){
  element.printBook();
 }
}}
if(numChoice=='3'){
  for (var element in dataBooks) {
 if(element.category=="Children's Books"){
  element.printBook();
 }
}
}
}



