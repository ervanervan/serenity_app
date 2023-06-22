import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/pages/favoritepage.dart';
import 'package:serenity/pages/profilepage.dart';
import 'package:serenity/pages/homepage.dart';

import '../utils/colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/home-icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/svgs/home-icon.svg",
                color: primary,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/favorite-icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/svgs/home-icon.svg",
                color: primary,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svgs/profile-icon.svg"),
              activeIcon: SvgPicture.asset(
                "assets/svgs/home-icon.svg",
                color: primary,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
