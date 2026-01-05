import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_NG', symbol: '₦', decimalDigits: 0);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header / Tag
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                product.category,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          // Image / Icon Area
          Center(
            child: Container(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: _buildPlatformIcon(product.platform),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currencyFormat.format(product.price),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                      label: const Text('Buy Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformIcon(String platform) {
    // Since we don't have the 3D assets, we'll use large colored icons with shadows to simulate the look
    IconData iconData;
    Color color;
    List<Color> gradientColors;

    switch (platform.toLowerCase()) {
      case 'instagram':
        iconData = Icons.camera_alt;
        color = Colors.pink;
        gradientColors = [Colors.purple, Colors.pink, Colors.orange];
        break;
      case 'twitter':
        iconData = Icons.alternate_email; // Closest to bird/X
        color = Colors.blue;
        gradientColors = [Colors.blue.shade800, Colors.blue.shade400];
        break;
      case 'facebook':
        iconData = Icons.facebook;
        color = Colors.blue.shade900;
        gradientColors = [Colors.blue.shade900, Colors.blue.shade700];
        break;
      default:
        iconData = Icons.devices;
        color = Colors.grey;
        gradientColors = [Colors.grey.shade700, Colors.grey.shade500];
    }

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Or rounded rect to match screenshot
        borderRadius: platform == 'instagram' ? BorderRadius.circular(40) : null,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: platform == 'instagram' 
        ? null // Instagram logo is usually the gradient itself, but let's add an icon for clarity
        : Icon(iconData, size: 80, color: Colors.white),
    ).childWithIcon(iconData);
  }
}

extension ContainerExtension on Container {
  Widget childWithIcon(IconData icon) {
    // Helper to add icon inside the gradient container
    return Container(
      width: 120,
      height: 120,
      decoration: decoration,
      child: Icon(icon, size: 60, color: Colors.white),
    );
  }
}
