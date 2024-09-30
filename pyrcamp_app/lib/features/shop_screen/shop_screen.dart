import 'package:flutter/material.dart';
//import 'package:pyrcamp_app/data/shop_items_list.dart';
import 'package:pyrcamp_app/features/shop_screen/widgets/shop_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ShopScreen extends StatefulWidget {
  //constructor
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('shop').snapshots(),
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
        print(loadedCategories);

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
                  height: 50, // Fixed height for horizontal ListView
                  child: ListView.builder(
                    itemCount: loadedCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentCategory = loadedCategories[index].data();

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          child: Text(
                            currentCategory['category'],
                          ),
                          onPressed: () {
                            // Handle category click
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

              //popular food
              //do przeanalizowania jeszcze
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: loadedCategories.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final currentCategory = loadedCategories[index];

                      // Pobranie danych z zagnieżdżonej kolekcji "data"
                      return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .doc(currentCategory.id) // id kategorii
                            .collection(
                                'data') // tutaj odwołujemy się do podkolekcji
                            .snapshots(),
                        builder: (ctx, dataSnapshot) {
                          if (dataSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (!dataSnapshot.hasData ||
                              dataSnapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text('No items found in this category'),
                            );
                          }

                          // Tutaj pobieramy produkty z podkolekcji
                          final loadedProducts = dataSnapshot.data!.docs;

                          // Wyświetlenie przycisków dla produktów
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: loadedProducts.map((productDoc) {
                              final currentProduct = productDoc.data();

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ElevatedButton(
                                  child: Text(
                                    currentProduct[
                                        'name_pol'], // wyświetlamy nazwę produktu
                                  ),
                                  onPressed: () {
                                    // Możesz tu dodać logikę, co się stanie po kliknięciu
                                    print(
                                        "Clicked on ${currentProduct['name_pol']}");
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 39, 83),
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
              height: 50, // Fixed height for horizontal ListView
              child: ListView.builder(
                itemCount: availableCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    child: Text(availableCategories[index].title),
                    onPressed: () {
                      // Handle category click
                    },
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 18),
            ),
          ),

          const SizedBox(height: 10),

          //popular food
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: availableShopItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => ShopTile(
                  shopItem: availableShopItems[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  */

