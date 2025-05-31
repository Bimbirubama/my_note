import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavbar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pinkAccent,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 14,
      unselectedFontSize: 13,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Folder',
          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.delete),
          label: 'sampah',

        ),
      ],
    );
  }
}
