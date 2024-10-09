import 'package:flutter/material.dart';

class TravelNavigationBar extends StatelessWidget {
  const TravelNavigationBar({
    super.key,
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  }) : assert(items.length == 2, '');

  final List<BottomTravelNavigationBar> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: kToolbarHeight,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Row(
        children: List.generate(
          items.length,
          (index) => Expanded(
            child: Icon(
              currentIndex == index
                  ? items[index].selectedIcon
                  : items[index].icon,
              color: currentIndex == index ? Colors.deepPurple.shade800 : null,
            ),
          ),
        )..insert(1, const Spacer()),
      ),
    );
  }
}

class BottomTravelNavigationBar {
  final IconData icon;
  final IconData selectedIcon;

  BottomTravelNavigationBar({
    required this.icon,
    required this.selectedIcon,
  });
}
