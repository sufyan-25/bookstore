import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get subtotal => globalCart.fold(0, (sum, item) => sum + item.subtotal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: globalCart.isEmpty
          ? const Center(child: Text("Cart is empty!"))
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        _buildCartList(),
                        const SizedBox(height: 30),
                        _buildTotalCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: const Color(0xFFEAF2F6),
      child: Column(
        children: const [
          Text(
            'Cart',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003F5C),
            ),
          ),
          Text('Home > Cart', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: globalCart.length,
      separatorBuilder: (c, i) => const Divider(),
      itemBuilder: (context, index) {
        final item = globalCart[index];
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red, size: 20),
              onPressed: () => setState(() => globalCart.removeAt(index)),
            ),
            Image.network(item.image, width: 40, height: 50, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "\$${item.price}",
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
            // Qty +/-
            Row(
              children: [
                InkWell(
                  onTap: () => setState(
                    () => item.quantity > 1 ? item.quantity-- : null,
                  ),
                  child: const Icon(Icons.remove_circle_outline, size: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text("${item.quantity}"),
                ),
                InkWell(
                  onTap: () => setState(() => item.quantity++),
                  child: const Icon(Icons.add_circle_outline, size: 20),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Text(
              "\$${item.subtotal}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTotalCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Subtotal"),
              Text("\$${subtotal.toStringAsFixed(2)}"),
            ],
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${subtotal.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005A80),
                shape: StadiumBorder(),
                padding: const EdgeInsets.all(15),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
