import 'package:flutter/material.dart';
import '../Models/products.dart';

class HomePage extends StatefulWidget {
  final List<Product> products;
  const HomePage({super.key, required this.products});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> vegetables = [
    Product(
        id: '1',
        name: 'Carrot',
        price: 5.99,
        imageUrl:
            'https://wallpapers.com/images/featured/carrot-png-7crm54jnhoaaa46f.jpg'),
    Product(
        id: '2',
        name: 'EggPlants',
        price: 5.99,
        imageUrl:
            'https://freepngimg.com/thumb/eggplant/2-2-eggplant-png-clipart-thumb.png'),
    Product(
        id: '3',
        name: 'Mint',
        price: 2.99,
        imageUrl:
            'https://img.lovepik.com/free-png/20210919/lovepik-creative-green-fresh-mint-leaves-png-image_400903748_wh1200.png'),
    Product(
        id: '4',
        name: 'Onion',
        price: 10.99,
        imageUrl:
            'https://purepng.com/public/uploads/large/purepng.com-oniononionvegetablegenus-alliumallium-fistulosumonions-170152726711155sjw.png'),
    Product(
        id: '5',
        name: 'Lemons',
        price: 8.99,
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvs8Pef60W6Ze56QT34wRwKgQfoz0AChxSJg&s'),
  ];

  final List<Product> fruits = [
    Product(
        id: '6',
        name: 'Apple',
        price: 2.99,
        imageUrl: 'https://pngfre.com/wp-content/uploads/apple-61-300x214.png'),
    Product(
        id: '7',
        name: 'Papaya',
        price: 8.99,
        imageUrl: 'https://www.kindpng.com/picc/m/144-1441424_papaya-hd-png-download.png'),

    Product(
        id: '8',
        name: 'Pineapple',
        price: 4.99,
        imageUrl: 'https://clipart-library.com/image_gallery2/Pineapple-Free-Download-PNG.png'),

    Product(
        id: '9',
        name: 'Gava',
        price: 5.99,
        imageUrl: 'https://static.vecteezy.com/system/resources/previews/029/334/144/non_2x/guava-transparent-background-png.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.limeAccent,
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.limeAccent,
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        backgroundColor: Colors.limeAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.limeAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/fresh veggies.jpg'),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.limeAccent,
                            blurRadius: 20,
                            offset: Offset(10, 10), // Shadow position
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40, left: 15),
                            child: Text(
                              "Flat 30% Off",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.limeAccent,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.green,
                                      offset: Offset(3, 3),
                                    )
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Its the biggest sale of the year!",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fresh Vegetables",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ))
              ],
            ),
          ),
          Container(
            height: 200, // Set the height of the row container
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // Set scroll direction to horizontal
              itemCount: vegetables.length,
              itemBuilder: (ctx, i) => Product(
                id: vegetables[i].id,
                name: vegetables[i].name,
                price: vegetables[i].price,
                imageUrl: vegetables[i].imageUrl,
              ),

              prototypeItem: Container(
                width: 150, // Set width for each item
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => HomePage(products: vegetables),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fresh Fruits",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text(
                      "View All",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ))
              ],
            ),
          ),
          Container(
            height: 200, // Set the height for the fruit row
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fruits.length,
              itemBuilder: (ctx, i) {
                return Product(
                  id: fruits[i].id,
                  name: fruits[i].name,
                  price: fruits[i].price,
                  imageUrl: fruits[i].imageUrl,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
