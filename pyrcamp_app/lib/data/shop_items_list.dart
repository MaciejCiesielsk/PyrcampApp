import 'package:pyrcamp_app/models/category.dart';
import 'package:pyrcamp_app/models/shop_item.dart';

var availableCategories = [
  Category(title: 'Żywność'),
  Category(title: 'Gadgety'),
  Category(title: 'Sprzęt biwakowy'),
  Category(title: 'jeszcze cos'),
];

var availableShopItems = [
  ShopItem(
      name: 'Kanapka',
      price: '12',
      imagePath: 'lib/assets/images/sandwich.png'),
  ShopItem(name: 'Baton', price: '5', imagePath: 'lib/assets/images/bar.png'),
  ShopItem(
      name: 'Ciasto + kawa',
      price: '16',
      imagePath: 'lib/assets/images/cake.png'),
];
