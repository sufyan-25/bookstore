class CartItem {
  final String name;
  final double price;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.image,
  });

  double get subtotal => price * quantity;
}

// Global list for the whole app
List<CartItem> globalCart = [];