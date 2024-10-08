import 'package:pyrcamp_app/features/shop_screen/widgets/category.dart';
import 'package:pyrcamp_app/features/shop_screen/widgets/shop_item.dart';
/*
_get_available_products_firebase() async {
  // Pobranie dokumentów z kolekcji 'shop'
  final QuerySnapshot availableProductsFirebase =
      await FirebaseFirestore.instance.collection('shop').get();
  return availableProductsFirebase;
}
*/

//var availableCategoriesFirebase = git_get_available_products_firebase();

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
