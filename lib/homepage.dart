import 'package:flutter/material.dart';
import 'package:shopping_app/cartpage.dart';
import 'package:shopping_app/favoritepage.dart';
import 'package:shopping_app/productcard.dart';
import 'package:shopping_app/productdata.dart';
import 'package:shopping_app/toprowbuttons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  String selectedCategory = 'All';

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return product;
    }
    return product
        .where((product) => product.brand == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          Column(
            children: [
              AppBar(
                elevation: 10,
                toolbarHeight: 150,
                title: Row(
                  children: [
                    Text(
                      'Shoes\nCollection',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search shoes...',
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      TopRowButtons(
                        text: 'All',
                        isSelected: selectedCategory == 'All',
                        onTap: () => setState(() => selectedCategory = 'All'),
                      ),
                      TopRowButtons(
                        text: 'Nike',
                        isSelected: selectedCategory == 'Nike',
                        onTap: () => setState(() => selectedCategory = 'Nike'),
                      ),
                      TopRowButtons(
                        text: 'Adidas',
                        isSelected: selectedCategory == 'Adidas',
                        onTap: () =>
                            setState(() => selectedCategory = 'Adidas'),
                      ),
                      TopRowButtons(
                        text: 'Bata',
                        isSelected: selectedCategory == 'Bata',
                        onTap: () => setState(() => selectedCategory = 'Bata'),
                      ),
                      TopRowButtons(
                        text: 'Puma',
                        isSelected: selectedCategory == 'Puma',
                        onTap: () => setState(() => selectedCategory = 'Puma'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: filteredProducts[index]);
                  },
                ),
              ),
            ],
          ),

          FavoritePage(),
          CartPage(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 35),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 35),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
