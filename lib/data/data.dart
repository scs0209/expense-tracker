import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'color': Colors.yellow[700],
    'name': 'Food',
    'totalAmount': '-\$45.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'color': Colors.purple,
    'name': 'Shopping',
    'totalAmount': '-\$230.00',
    'date': 'Today',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'color': Colors.green,
    'name': 'Health',
    'totalAmount': '-\$79.00',
    'date': 'Yesterday',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    'color': Colors.blue,
    'name': 'Travel',
    'totalAmount': '-\$350.00',
    'date': 'Today',
  },
];

List<IconData> icons = [
  Icons.house,
  Icons.person,
  Icons.mail,
  Icons.notifications,
  Icons.camera,
  Icons.directions_car,
  Icons.coffee,
  Icons.settings,
  Icons.pets,
  Icons.favorite,
  Icons.star,
  Icons.shopping_bag,
  Icons.music_note,
  Icons.video_file,
  Icons.book,
];
