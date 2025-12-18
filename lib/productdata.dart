class Product {
  final String name;
  final int price;
  final String imagePath;
  final String brand;
  final List<String> images;
  const Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.imagePath,
    required this.images,
  });
}

final List<Product> product = [
  Product(
    name: 'Nike Air Max',
    brand: 'Nike',
    price: 4999,
    imagePath: 'assets/images/nike/nike1.png',
    images: [
      'assets/images/nike/nikeh1.png',
      'assets/images/nike/nikeh2.png',
      'assets/images/nike/nikeh3.png',
      'assets/images/nike/nikeh4.png',
      'assets/images/nike/nikeh5.png',
    ],
  ),
  Product(
    name: 'Nike Revolution',
    brand: 'Nike',
    price: 3999,
    imagePath: 'assets/images/nike/nike2.png',
    images: [
      'assets/images/nike/nikehh1.png',
      'assets/images/nike/nikehh2.png',
      'assets/images/nike/nikehh3.png',
      'assets/images/nike/nikehh4.png',
      'assets/images/nike/nikehh5.png',
    ],
  ),
  Product(
    name: 'Adidas Ultraboost',
    brand: 'Adidas',
    price: 5999,
    imagePath: 'assets/images/adidas/adidas1.png',
    images: [
      'assets/images/adidas/adidash1.png',
      'assets/images/adidas/adidash2.png',
      'assets/images/adidas/adidash3.png',
      'assets/images/adidas/adidash4.png',
      'assets/images/adidas/adidash5.png',
    ],
  ),
  Product(
    name: 'Adidas Cool Run',
    brand: 'Adidas',
    price: 2999,
    imagePath: 'assets/images/adidas/adidas2.png',
    images: [
      'assets/images/adidas/adidashh1.png',
      'assets/images/adidas/adidashh2.png',
      'assets/images/adidas/adidashh3.png',
      'assets/images/adidas/adidashh4.png',
      'assets/images/adidas/adidashh5.png',
    ],
  ),

  Product(
    name: 'Bata Power Run',
    brand: 'Bata',
    price: 2999,
    imagePath: 'assets/images/bata/bata1.png',
    images: [
      'assets/images/bata/batah1.png',
      'assets/images/bata/batah2.png',
      'assets/images/bata/batah3.png',
      'assets/images/bata/batah4.png',
      'assets/images/bata/batah5.png',
    ],
  ),
  Product(
    name: 'Bata Formal',
    brand: 'Bata',
    price: 4999,
    imagePath: 'assets/images/bata/bata2.png',
    images: [
      'assets/images/bata/batahh1.png',
      'assets/images/bata/batahh2.png',
      'assets/images/bata/batahh3.png',
      'assets/images/bata/batahh4.png',
      'assets/images/bata/batahh5.png',
    ],
  ),
  Product(
    name: 'Campus Run',
    brand: 'Campus',
    price: 3999,
    imagePath: 'assets/images/campus/campus1.png',
    images: [
      'assets/images/campus/campush1.png',
      'assets/images/campus/campush2.png',
      'assets/images/campus/campush3.png',
      'assets/images/campus/campush4.png',
      'assets/images/campus/campush5.png',
    ],
  ),
  Product(
    name: 'Campus Ultra Run',
    brand: 'Campus',
    price: 5999,
    imagePath: 'assets/images/campus/campus2.png',
    images: [
      'assets/images/campus/campushh1.png',
      'assets/images/campus/campushh2.png',
      'assets/images/campus/campushh3.png',
      'assets/images/campus/campushh4.png',
      'assets/images/campus/campushh5.png',
    ],
  ),
  Product(
    name: 'Puma Classic',
    brand: 'Puma',
    price: 2999,
    imagePath: 'assets/images/puma/puma1.png',
    images: [
      'assets/images/puma/pumah1.png',
      'assets/images/puma/pumah2.png',
      'assets/images/puma/pumah3.png',
      'assets/images/puma/pumah4.png',
      'assets/images/puma/pumah5.png',
    ],
  ),
  Product(
    name: 'Puma Advanced',
    brand: 'Puma',
    price: 2999,
    imagePath: 'assets/images/puma/puma2.png',
    images: [
      'assets/images/puma/pumahh1.png',
      'assets/images/puma/pumahh2.png',
      'assets/images/puma/pumahh3.png',
      'assets/images/puma/pumahh4.png',
      'assets/images/puma/pumahh5.png',
    ],
  ),
];

class CartItem {
  final Product product;
  int size;
  int quantity;
  int price;
  CartItem({
    required this.product,
    required this.size,
    this.quantity = 1,
    required this.price,
  });
}

final List<CartItem> cart = [];

final List<CartItem> favorites = [];
