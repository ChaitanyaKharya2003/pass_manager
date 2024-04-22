import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pass_manager/screens/home.dart';
import 'package:pass_manager/utils/colors.dart';
import 'package:pass_manager/utils/sizes.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  Widget currentScreen = HomePage(title: 'Welcome to Password Manager');
  int _index = 0;
  void onClick(int index) {
    setState(() {
      _index = index;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted && FirebaseAuth.instance.currentUser == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        currentScreen = HomePage(title: 'Welcome to Password Manager');
        break;
      case 1:
        currentScreen = HomePage(title: 'ADD');
        break;
      case 2:
        currentScreen = HomePage(title: 'Settings');
        break;
      case 3:
        _signOut();
        break;
    }
    ;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'Welcome ${FirebaseAuth.instance.currentUser!.displayName}', style: TextStyle(fontSize: getHeight(context, 2))), ),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onClick,
        currentIndex: _index,
        selectedItemColor: kblue,
        unselectedItemColor: kBlack,
        unselectedLabelStyle: const TextStyle(color: kBlack),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
