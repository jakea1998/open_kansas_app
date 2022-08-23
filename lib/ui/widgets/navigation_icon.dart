import 'package:flutter/material.dart';

/// Navigation icon widget
/// @param icon: The type of icon
class NavigationIcon extends StatelessWidget {
  final IconData icon;

  NavigationIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
    );
  }
}