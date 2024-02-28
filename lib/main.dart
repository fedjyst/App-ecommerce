import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // List de pwodui
  final List<Map<String, dynamic>> products = [
    {
      'imagePath': 'assets/item1.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Air jordan, vert et kaki, stil bot',
      'itemPrice': 1000.0,
    },
    {
      'imagePath': 'assets/item2.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Air jordan, style bot, koule gris ak yon bleu ciel',
      'itemPrice': 1500.0,
    },
    {
      'imagePath': 'assets/item3.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Bel Retro 1 rose et blan ',
      'itemPrice': 1200.0,
    },
    {
      'imagePath': 'assets/item4.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Retro gris et noir low',
      'itemPrice': 1100.0,
    },
    {
      'imagePath': 'assets/item5.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Retro high, noir et rose pale',
      'itemPrice': 1800.0,
    },
    {
      'imagePath': 'assets/item6.jpg',
      'itemName': 'Retro 1',
      'itemDescription':
          'Retro 1, hight, koule rouj et blan, bien design. stil bot',
      'itemPrice': 2000.0,
    },
    {
      'imagePath': 'assets/item8.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Retro 1, bleu et blanc pour femme',
      'itemPrice': 1000.0,
    },
    {
      'imagePath': 'assets/item7.jpg',
      'itemName': 'Retro 1',
      'itemDescription': 'Nike dunk vert et orange',
      'itemPrice': 1700.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PranPawLa'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: Drazwea(products: products),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          
          CategoryItem(
            imagePath: 'assets/cat3.jpg',
            categoryName: 'Sneakers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsList(products: products),
                ),
              );
            },
          ),
          CategoryItem(
            imagePath: 'assets/cat2.jpeg',
            categoryName: 'Tennis',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsList(products: products),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              products.length,
              (index) => ListItem(
                imagePath: products[index]['imagePath'],
                itemName: products[index]['itemName'],
                itemDescription: products[index]['itemDescription'],
                itemPrice: products[index]['itemPrice'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(
                        imagePath: products[index]['imagePath'],
                        productName: products[index]['itemName'],
                        productDescription: products[index]['itemDescription'],
                        productPrice: products[index]['itemPrice'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final VoidCallback onTap;

  const CategoryItem({
    required this.imagePath,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget pou yon itèm nan lis
class ListItem extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final String itemDescription;
  final double itemPrice;
  final VoidCallback onTap;

  const ListItem({
    required this.imagePath,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5), // Radius de 5px
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), // Radius de 5px
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              itemName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5),
            Text(
              '\$$itemPrice',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              itemDescription,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class Drazwea extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const Drazwea({required this.products});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 75, 60, 60),
            ),
            child: Text(
              'PranPawLa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Konekte'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Lis Pwodwi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsList(products: products),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Dekonekte'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productDescription;
  final double productPrice;

  const ProductDetail({
    required this.imagePath,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            productName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$$productPrice',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              productDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  print('Like pou $productName');
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  print('Ajoute $productName nan panier');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductsList({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lis Pwodwi'),
        backgroundColor: Color.fromARGB(255, 6, 19, 78),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // Aspect ratio pou redui taille boite yo
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListItem(
            imagePath: products[index]['imagePath'],
            itemName: products[index]['itemName'],
            itemDescription: products[index]['itemDescription'],
            itemPrice: products[index]['itemPrice'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    imagePath: products[index]['imagePath'],
                    productName: products[index]['itemName'],
                    productDescription: products[index]['itemDescription'],
                    productPrice: products[index]['itemPrice'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
