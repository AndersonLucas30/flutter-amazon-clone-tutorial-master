import 'package:flutter/material.dart';

String uri = 'https://amazon-clone-rrr.herokuapp.com'; 
 /* String uri = 'http://10.0.2.2:3000';  */

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 241, 71, 4),
      Color.fromARGB(255, 245, 95, 35),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 0, 0, 0); // Cor da Seleção de campos
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xFFF14704);
  static var selectedNavBarColor = const Color.fromARGB(255, 82, 154, 158);
  static const unselectedNavBarColor = Color.fromARGB(221, 160, 106, 106);

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Construções',
      'image': 'assets/images/obra.jpeg',
    },
    {
      'title': 'Encanamento',
      'image': 'assets/images/encanamento.jpeg',
    },
    {
      'title': 'Elétrica',
      'image': 'assets/images/eletrica.jpeg',
    },
    {
      'title': 'Marcenaria',
      'image': 'assets/images/marcenaria.png',
    },
    {
      'title': 'Mecânica',
      'image': 'assets/images/manutencao.jpeg',
    },
  ];
}
