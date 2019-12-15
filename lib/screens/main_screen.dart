import 'package:flutter/material.dart';
import 'package:test_flutter_app/components/icon_navigation_bar.dart';
import 'package:test_flutter_app/screens/todos_screen.dart';
import 'package:test_flutter_app/screens/users_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTab = 0;

  final _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Data'),
      ),
      body: PageView(
        children: <Widget>[UsersScreen(), TodosScreen()],
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: IconNavigationBar(
        currentIndex: _currentTab,
        icons: [
          const IconNavigationBarItem(
            icon: Icon(Icons.people),
            tooltip: 'Users',
          ),
          const IconNavigationBarItem(
            icon: Icon(Icons.assignment),
            tooltip: 'Todos',
          ),
          const IconNavigationBarItem(
            icon: Icon(Icons.photo_album),
            tooltip: 'Photo albums',
          ),
        ],
        onTap: (index) {
          if (_currentTab != index) {
            _changeTab(index);
          } else {
            // Scroll to the top
          }
        },
      ),
    );
  }

  void _changeTab(int index) {
    setState(() {
      _currentTab = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInExpo,
      );
    });
  }
}
