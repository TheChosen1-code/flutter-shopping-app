import 'package:flutter/material.dart';
import 'package:shopping_app/productdata.dart';
import 'package:shopping_app/productinfopage.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductInfo(product: product),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Product Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Image.asset(
                  product.imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '₹ ${product.price}',
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
