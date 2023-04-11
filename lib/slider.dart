import 'dart:js';
import 'package:flutter/material.dart';

class Slider {
  
  static List<Widget> _buildPageIndicator(List<String> _images, int _currentPage) {
    return List<Widget>.generate(
      _images.length,
      (int index) => _indicator(index == _currentPage),
    );
  }

  static Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}