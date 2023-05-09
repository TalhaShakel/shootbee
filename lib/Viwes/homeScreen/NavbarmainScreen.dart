import 'package:flutter/material.dart';
import 'package:shootbee/Viwes/homeScreen/profileScreen.dart';

import 'homeScreen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    HomeScreen(),
    Text('Search'),
    HomeScreen(),
    Text('Shorts'),
    profileScreen(),
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        // height: 100,
        decoration: BoxDecoration(
          // color: Colors.,
          gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.black, Colors.pinkAccent]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          // selectedIconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.transparent,

          // fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(
                Icons.add_circle,
                size: 31,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.play_arrow),
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 2) {
              // show menu
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  MediaQuery.of(context).size.width / 2 - 50,
                  MediaQuery.of(context).size.height - 100,
                  MediaQuery.of(context).size.width / 2 - 50,
                  0,
                ),
                items: [
                  PopupMenuItem(
                    child: GestureDetector(
                      child: Text('Post'),
                      onTap: () {
                        // handle post
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      child: Text('Story'),
                      onTap: () {
                        // handle story
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      child: Text('Shorts'),
                      onTap: () {
                        // handle shorts
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
              _onItemTapped(index);
            } else {
              _onItemTapped(index);
            }
          },
        ),
      ),
    );
  }
}
