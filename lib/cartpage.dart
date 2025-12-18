import 'package:flutter/material.dart';
import 'package:shopping_app/productdata.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int calculateTotalPrice() {
    int total = 0;

    for (final item in cart) {
      total += item.product.price;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 10,
        title: Text('Your Cart', style: TextStyle(fontSize: 25)),
      ),

      body: (cart.isEmpty)
          ? Center(
              child: Text(
                'Your cart is \n empty',
                style: TextStyle(fontSize: 45),
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price : ₹${calculateTotalPrice()}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            final cartItem = cart[index];
                            return Padding(
                              padding: const EdgeInsetsGeometry.only(
                                left: 0,
                                right: 0,
                                top: 8,
                                bottom: 8,
                              ),
                              child: ListTile(
                                isThreeLine: true,
                                title: Text(cartItem.product.name),
                                subtitle: Text(
                                  'Price : ₹${cartItem.price.toString()} \t Quantity : ${cartItem.quantity} \n Size : ${cartItem.size.toString()}',
                                ),

                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    cartItem.product.imagePath,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    60,
                                  ),
                                ),

                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: AlignmentGeometry.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      calculateTotalPrice() == 0
                                          ? 'Please add something to cart'
                                          : 'Your order has been placed',
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              child: Text('BUY NOW'),
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
