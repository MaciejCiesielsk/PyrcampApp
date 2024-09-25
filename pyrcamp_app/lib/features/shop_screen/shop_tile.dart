import 'package:flutter/material.dart';
import 'package:pyrcamp_app/models/shop_item.dart';

class ShopTile extends StatelessWidget {
  //constructor
  const ShopTile({super.key, required this.shopItem});

  //variables
  final ShopItem shopItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //image
            Image.asset(
              shopItem.imagePath,
              height: 140,
            ),
            //name + price
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //name
                Text(shopItem.name),
                //price
                Text('${shopItem.price} zł')
              ],
            )
          ],
        ),
      ),
    );
  }
}
