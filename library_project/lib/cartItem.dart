class CartItem{
  String itemName;
  double total;
  CartItem(this.itemName, this.total);
  void displayItemData(){
    print('book:: $itemName and total price for it:: $total');
  }
}