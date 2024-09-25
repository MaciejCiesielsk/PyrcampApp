import 'package:flutter/material.dart';
import 'package:pyrcamp_app/data/shop_items_list.dart';
import 'package:pyrcamp_app/features/shop_screen/shop_tile.dart';

class ShopScreen extends StatefulWidget {
  //constructor
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
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
}
