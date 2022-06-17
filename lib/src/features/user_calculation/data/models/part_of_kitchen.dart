import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';

class PartOfKitchen {
  int id;
  Color colorOfPart;
  final String imagePath;
  bool isActive;
  String partName;
  double price;
  double partSize;

  PartOfKitchen({
    required this.partSize,
    required this.price,
    required this.id,
    required this.colorOfPart,
    required this.imagePath,
    required this.isActive,
    required this.partName,
  });

  static List<PartOfKitchen> _partsOfKitchenList = [
    PartOfKitchen(
      id: 0,
      colorOfPart: lightBlueGrey,
      partName: 'Herd',
      imagePath: 'assets/images/Backofen.png',
      isActive: false,
      price: 50,
      partSize: 100,
    ),
    PartOfKitchen(id: 1, colorOfPart: lightBlueGrey, partName: 'Hängeschränke', imagePath: 'assets/images/Backofen.png', isActive: false, price: 50, partSize: 100),
    PartOfKitchen(id: 2, colorOfPart: lightBlueGrey, partName: 'Waschmaschine', imagePath: 'assets/images/Backofen.png', isActive: false, price: 50, partSize: 100),
    PartOfKitchen(id: 3, colorOfPart: lightBlueGrey, partName: 'Spülmaschine', imagePath: 'assets/images/Spule.png', isActive: false, price: 50, partSize: 100),
    PartOfKitchen(id: 4, colorOfPart: lightBlueGrey, partName: 'Arbeitsplatte schneiden', imagePath: 'assets/images/Spule.png', isActive: false, price: 50, partSize: 100),
    PartOfKitchen(id: 5, colorOfPart: lightBlueGrey, partName: 'Gebrauchte Küche', imagePath: 'assets/images/Spule.png', isActive: false, price: 50, partSize: 100),
  ];

  static List<PartOfKitchen> getList() => _partsOfKitchenList;
}
