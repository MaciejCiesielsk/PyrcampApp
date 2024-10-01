import 'package:flutter/material.dart';
//import 'package:pyrcamp_app/data/shop_items_list.dart';
import 'package:pyrcamp_app/features/shop_screen/widgets/shop_tile.dart';
import 'package:pyrcamp_app/features/shop_screen/widgets/shop_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ShopScreen extends StatefulWidget {
  //constructor
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  //variables
  //ShopItem shopItem = ShopItem(name: '', price: '', imagePath: '');
  var _productName = '';
  var _productPrice = '';
  var _productImagePath = '';
  var _currentCategory = 'shop_food';

  //methods
  StreamBuilder _loadItems(String collectionName) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No items found in this category'),
          );
        }
        //ta czesc musi byc po ifie sprawdzajacym, czy dane istnieja, wtedy mozemy dac !
        final loadedItems = snapshot.data!.docs;

        return ListView.builder(
          itemCount: loadedItems.length,
          itemBuilder: (context, index) {
            //TODO w innym pliku docelowo

            final currentProduct = loadedItems[index].data();
            _productName = currentProduct['name_pol'];
            _productPrice = currentProduct['price'];
            _productImagePath = currentProduct['image_path'];

            return ShopTile(
                shopItem: ShopItem(
                    name: _productName,
                    price: _productPrice,
                    imagePath: _productImagePath));

            /*
            return ElevatedButton(
              onPressed: () {},
              child: Text(
                currentProduct['name_pol'],
              ),
            );
            */
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('shop_categories').snapshots(),
      builder: (ctx, chatSnapshot) {
        //categories are loaded
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //errors
        if (chatSnapshot.hasError) {
          return const Center(
            child: Text('something went wrong'),
          );
        }

        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('no items found'),
          );
        }

        //ta czesc musi byc po ifie sprawdzajacym, czy dane istnieja, wtedy mozemy dac !
        final loadedCategories = chatSnapshot.data!.docs;

        //loading items in categories
        //final loadedItems = _loadItems('shop_food');

        //normal version withot errors
        return Scaffold(
          //backgroundColor: const Color.fromARGB(255, 66, 39, 83),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Pyrcamp Shop'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: loadedCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentCategory = loadedCategories[index].data();

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          child: Text(
                            currentCategory['category_name_pol'],
                          ),
                          onPressed: () {
                            //handle category click
                            setState(() {
                              _currentCategory =
                                  'shop_${currentCategory['category_name_eng']}';
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 25),

              //menu list
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'items:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 18),
                ),
              ),

              const SizedBox(height: 10),

              //products in category

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: _loadItems(_currentCategory),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
