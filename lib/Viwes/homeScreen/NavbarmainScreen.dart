import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shootbee/Viwes/Searchpages/SearchScreen.dart';
import 'package:shootbee/Viwes/Shorts/ShortsView.dart';
import 'package:shootbee/Viwes/Utils/Service&Function.dart';
import 'package:shootbee/Viwes/homeScreen/VideoPlayerScreen.dart';
import 'package:shootbee/Viwes/homeScreen/VideoPostScreen.dart';
import 'package:shootbee/Viwes/homeScreen/postScreen.dart';
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
    SearchScreen(),
    HomeScreen(),
    ShortsVideoPlayScreens(),
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
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
            // color: Color(0x00ffffff),
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.black, Colors.pinkAccent]),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
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
            backgroundColor: Color(0x00ffffff),
            elevation: 0, // to get rid of the shadow
            // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
            // type: BottomNavigationBarType.fixed,
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
                          Get.to(() => PostScreen());
                          // Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                        child: Text('Story'),
                        onTap: () async {},
                      ),
                    ),
                    PopupMenuItem(
                      child: GestureDetector(
                        child: Text('Shorts'),
                        onTap: () async {
                          // handle shorts
                          // Get.to(() => VideoPostScreen());

                          XFile? pickedFile;
                          try {
                            pickedFile = await selectVideo();
                            if (pickedFile != null) {
                              Get.to(
                                  () => VideoPlayerScreen(video: pickedFile!));
                            } else {
                              Get.snackbar('No video selected', '');
                            }
                          } catch (e) {
                            Get.snackbar('Error selecting video', e.toString());
                          }
                          // Navigator.pop(context);
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
