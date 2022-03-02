import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final IconData icon;
  final String name;
  final String routeName;
  final Widget screen;

  MenuOption({
    required this.icon, 
    required this.name, 
    required this.routeName, 
    required this.screen
  });
}