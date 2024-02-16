import 'package:coba_tampilan/HomePage.dart';
import 'package:coba_tampilan/ProdukPageBaru.dart';
import 'package:coba_tampilan/ProfilPageBaru.dart';
import 'package:coba_tampilan/SettingPage.dart';
import 'package:flutter/material.dart';

class BerandaPageBaru extends StatefulWidget {
  const BerandaPageBaru({Key? key}) : super(key: key);

  @override
  _BerandaPageBaruState createState() => _BerandaPageBaruState();
}

class _BerandaPageBaruState extends State<BerandaPageBaru> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    ProdukPageBaru(),
    ProfilPageBaru(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

void _onTabTapped(int index) {
  if (index == 2) {
    // Handle the plus button click
  } else if (index >= 0 && index < _children.length) {
    setState(() {
      _currentIndex = index;
    });
  }
}

}
