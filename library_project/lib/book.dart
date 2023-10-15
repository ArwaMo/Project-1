class Book {
  String id;
  String title;
  String category;
  String author;
  int copies;
  double price;

  Book({
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.copies,
    required this.price,
  });

  printBook() {
    print("book name:: $title & book category:: $category & book author:: $author & copies:: $copies & price:: $price");
  }
}
