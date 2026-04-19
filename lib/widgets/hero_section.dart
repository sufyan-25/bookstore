import 'package:flutter/material.dart';
import 'package:bookstore/config/config.dart';
import 'package:bookstore/widgets/cart_item.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Flutter Cookbook',
      'price': 24.99,
      'image': 'assets/splash_logo_transparent.png',
    },
    {
      'name': 'Design Patterns',
      'price': 18.49,
      'image': 'assets/splash_logo_transparent.png',
    },
    {
      'name': 'Mobile UI Guide',
      'price': 15.99,
      'image': 'assets/splash_logo_transparent.png',
    },
    {
      'name': 'Dart Mastery',
      'price': 12.00,
      'image': 'assets/splash_logo_transparent.png',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      globalCart.add(
        CartItem(
          name: product['name'] as String,
          price: product['price'] as double,
          image: product['image'] as String,
        ),
      );
    });
  }

  Widget _buildProductCard(Map<String, dynamic> product, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(vertical: isActive ? 0 : 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.asset(
              product['image'] as String,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${(product['price'] as double).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _addToCart(product),
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text(AppStrings.addToCart),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.featuredBooks,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppStrings.tagline,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 330,
            child: PageView.builder(
              controller: _pageController,
              itemCount: (_products.length / 2).ceil(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final start = index * 2;
                final end = start + 2 > _products.length
                    ? _products.length
                    : start + 2;
                final pageProducts = _products.sublist(start, end);
                final isActivePage = index == _currentPage;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _buildProductCard(pageProducts[0], isActivePage),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: pageProducts.length > 1
                          ? _buildProductCard(pageProducts[1], isActivePage)
                          : const SizedBox.shrink(),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (_products.length / 2).ceil(),
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.white30,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:bookstore/config/config.dart';

// class HeroSection extends StatefulWidget {
//   const HeroSection({super.key});

//   @override
//   State<HeroSection> createState() => _HeroSectionState();
// }

// class _HeroSectionState extends State<HeroSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Color(0xFF292929),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset('assets/splash_logo_transparent.png'),
//           Text(
//             'Hero Section',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             AppStrings.tagline,
//             style: TextStyle(color: Colors.white, fontSize: 10),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               SplashScreen();
//             },
//             child: Text('Get Started'),
//           ),
//         ],
//       ),
//     );
//   }
// }
