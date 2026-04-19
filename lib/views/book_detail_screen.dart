import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import '../widgets/cart_screen.dart';

class BookDetailScreen extends StatefulWidget {
  final Map<String, dynamic> book;
  const BookDetailScreen({super.key, required this.book});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int qty = 1;
  int selectedImage = 0;

  // READ A LITTLE DIALOG
  void _showReadDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Reading: ${widget.book['title']}"),
        content: SingleChildScrollView(
          child: Text(
            "Chapter 1: The Beginning...\n\n"
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
            "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
            "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
            "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  // ADD TO CART FUNCTION
  void _handleAddToCart() {
    bool found = false;
    for (var item in globalCart) {
      if (item.name == widget.book["title"]) {
        item.quantity = qty;
        found = true;
        break;
      }
    }
    if (!found) {
      globalCart.add(
        CartItem(
          name: widget.book["title"],
          price: widget.book["price"].toDouble(),
          quantity: qty,
          image: widget.book["images"][0],
        ),
      );
    }

    // Navigate to Cart
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    ).then((value) {
      setState(() {}); // Refresh detail screen if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    List images = widget.book["images"];
    return Scaffold(
      //App bar already provided in home screen, so we can skip it here for a cleaner look
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery
            Container(
              padding: const EdgeInsets.all(0),
              color: const Color(0xfff7f7f7),
              child: Image.network(
                images[selectedImage],
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),
            //Image list of thumbnails
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (index) => GestureDetector(
                  onTap: () => setState(() => selectedImage = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedImage == index
                            ? Colors.orange
                            : Colors.transparent,
                      ),
                    ),
                    child: Image.network(images[index], height: 50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Details
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Details
                  Text(
                    widget.book["title"],
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Stock Availability",
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${widget.book["price"]}",
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.book["description"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  // Read Button
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue[300],
                      side: const BorderSide(color: Colors.orange),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _showReadDialog, // 🔥 NEW FUNCTION
                    child: const Text("Read A Little"),
                  ),
                  const SizedBox(height: 10),
                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Add Button
                      ElevatedButton(
                        onPressed: _handleAddToCart, // 🔥 FIXED FUNCTION
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0d9488),
                        ),
                        child: const Text(
                          "Add To Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Qty
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  setState(() => qty > 1 ? qty-- : null),
                              icon: const Icon(Icons.remove),
                            ),
                            Text(qty.toString()),
                            IconButton(
                              onPressed: () => setState(() => qty++),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Discarded not needed in mobile app
  // Widget _buildHeader() {
  //   return Container(
  //     width: double.infinity,
  //     padding: const EdgeInsets.symmetric(vertical: 30),
  //     color: const Color(0xffeef3f6),
  //     child: Column(
  //       children: const [
  //         Text(
  //           "Shop Details",
  //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //         ),
  //         Text("Home > Shop Details"),
  //       ],
  //     ),
  //   );
  // }
}
