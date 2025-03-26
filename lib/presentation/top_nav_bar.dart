import 'package:flutter/material.dart';

enum TabMenus {
  smartPost(title: "Smart Post"),
  library(title: "Library"),
  communities(title: "Communities"),
  shareWin(title: "Share & Win");
  const TabMenus({required this.title});

  final String title;
}

class TopNavBar extends StatefulWidget {
  const TopNavBar({
    super.key,
  });

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  int selectedTabMenuIndex = TabMenus.smartPost.index;

  onSelectedTabMenu(int index) {
    setState(() {
      selectedTabMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: TabMenus.values.map((tabMenu) => NavTab(
            title: tabMenu.title,
            isSelected: selectedTabMenuIndex == tabMenu.index,
            onPressed: () => onSelectedTabMenu(tabMenu.index),
          )).toList(),
        ),
      ),
    );
  }
}

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  final String title;
  final bool isSelected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: isSelected ? Colors.green : Colors.black,
        ),
      ),
    );
  }
}