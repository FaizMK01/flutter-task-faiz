class CartItem {
  final String dataSize;
  final String validDays;
  final String price;
  int quantity;

  CartItem({
    required this.dataSize,
    required this.validDays,
    required this.price,
    this.quantity = 1,
  });
}
