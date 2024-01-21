import 'package:crafty_bay/presentation/ui/screens/carts_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wishlist_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartsScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          _currentIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Carts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Wishlist"),
        ],
      ),
    );
  }
}
