import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/form_screen/form_screen.dart';
import 'package:pyrcamp_app/features/main_screen/widgets/menu_item.dart';
import 'package:pyrcamp_app/features/map_screen/map_screen.dart';
import 'package:pyrcamp_app/features/shop_screen/shop_screen.dart';
import 'package:pyrcamp_app/features/form_screen/main_person_form.dart';
import 'package:pyrcamp_app/features/faq_screen/faq_screen.dart';
import 'package:pyrcamp_app/features/form_screen/form_screen.dart';

const availableMenuItems = [
  MenuItem(
      id: 'mi1',
      nextScreen: FormScreen(),
      title: 'Formularz zgłoszeniowy',
      icon: Icon(Icons.edit)),
  MenuItem(
      id: 'mi2',
      nextScreen: ShopScreen(),
      title: 'Sklep',
      icon: Icon(Icons.shop_2)),
  MenuItem(
      id: 'mi3',
      nextScreen: FaqScreen(),
      title: 'FAQ',
      icon: Icon(Icons.question_mark)),
  MenuItem(
      id: 'mi4',
      nextScreen: MapScreen(),
      title: 'Mapa',
      icon: Icon(Icons.map)),
];
