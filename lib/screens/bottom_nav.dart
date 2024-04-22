import 'package:flutter/material.dart';
import 'package:pass_manager/screens/home.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  Widget currentScreen = HomePage(title: 'Welcome to Password Manager');
  int _index = 0;
  void onClick(int index){
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        print("HOME");
        currentScreen = HomePage(title: 'Welcome to Password Manager');
        break;
      case 1:
        currentScreen = HomePage(title: 'ADD');
        break;
      case 2:
        print("Settings");
        currentScreen = HomePage(title: 'Settings');
        break;
    }
    ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Manager'),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onClick,
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
