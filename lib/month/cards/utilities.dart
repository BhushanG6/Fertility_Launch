import 'package:flutter/material.dart';

/// Get required height of padding for swipeable card
double getTopPaddingOfCard(int index, double totalHight,
    {double topPadding = 0, bool isbottomNavBar = true}) {
  totalHight -= (isbottomNavBar ? kBottomNavigationBarHeight : 0) + topPadding;

  // return topPadding + totalHight / 2 + (totalHight / 10) * (index);
  return ((totalHight - kBottomNavigationBarHeight) / 10) * (index);
}
