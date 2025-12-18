import 'package:flutter/material.dart';
import 'package:shopping_app/productdata.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_providers.dart';

class ProductInfo extends StatefulWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int quant = 0;
  int selectedSize = 8;
  String selectedType = '8';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 100,
        title: const Text('Product Info', style: TextStyle(fontSize: 25)),
        actions: [
          IconButton(
            onPressed: () {
              final favProvider = context.read<FavoritesProvider>();
              final wasFavorite = favProvider.isFavorite(widget.product);

              favProvider.toggleFavorite(widget.product);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasFavorite ? 'Removed from Wishlist' : 'Added to Wishlist',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(
              Icons.favorite,
              size: 25,
              color:
                  context.watch<FavoritesProvider>().isFavorite(widget.product)
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 280,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: widget.product.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          widget.product.images[index],
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Text(
                '₹ ${widget.product.price}',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),

            Text('Size', style: TextStyle(fontSize: 20, color: Colors.grey)),
            SizedBox(height: 10),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  SizeButtons(
                    text: (i + 8).toString(),
                    isSelected: selectedType == (i + 8).toString(),
                    onTap: () {
                      setState(() {
                        selectedType = (i + 8).toString();
                        selectedSize = i + 8;
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cart.add(
                    CartItem(
                      product: widget.product,
                      size: selectedSize,
                      price: widget.product.price,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, size: 30),
                    Text('Add To Cart', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SizeButtons extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeButtons({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.grey.shade200,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}
