import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_providers.dart';
import '../productdata.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavoritesProvider>();
    final favorites = favProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 10,
        title: const Text('Favorites', style: TextStyle(fontSize: 25)),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'Your wishlist is empty',
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price : ₹${favProvider.totalPrice}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final item = favorites[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                isThreeLine: true,
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    item.product.imagePath,
                                  ),
                                ),
                                title: Text(item.product.name),
                                subtitle: Text(
                                  'Price : ₹${item.product.price}\n'
                                  'Size : ${item.size} | Qty : ${item.quantity}',
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        context
                                            .read<FavoritesProvider>()
                                            .removeAt(index);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.shopping_cart),
                                      onPressed: () {
                                        cart.add(item);
                                        context
                                            .read<FavoritesProvider>()
                                            .removeAt(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              onPressed: () {
                                cart.addAll(favorites);
                                context
                                    .read<FavoritesProvider>()
                                    .clearFavorites();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'All items added to cart successfully',
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Add All To Cart'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
