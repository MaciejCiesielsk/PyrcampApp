import 'package:flutter/material.dart';
import 'package:pyrcamp_app/features/main_screen/menu_item.dart';
import 'package:pyrcamp_app/features/shop_screen/shop_screen.dart';
import 'package:pyrcamp_app/features/ticket_form/ticket_form_screen.dart';

const availableMenuItems = [
  MenuItem(
      id: 'mi1', nextScreen: FormScreen(), title: 'Formularz zgłoszeniowy'),
  MenuItem(id: 'mi2', nextScreen: ShopScreen(), title: 'Sklep'),
  MenuItem(id: 'mi3', nextScreen: FormScreen(), title: 'FAQ'),
  MenuItem(id: 'mi4', nextScreen: FormScreen(), title: 'Mapa'),
];
