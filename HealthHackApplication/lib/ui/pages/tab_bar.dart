import 'package:flutter/material.dart';
import 'package:healthhack/model/bmi.dart';
import 'package:healthhack/ui/pages/home_screen.dart';
import 'package:healthhack/ui/pages/profile_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {

  int tabIndex = 0;
  late List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      HomePage(),
      BMI(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),

        child: BottomNavigationBar(
          currentIndex: tabIndex,
          onTap: (int index) {
            setState(() {
              tabIndex = index;
            });
          },
          iconSize: 25,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),


          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(Icons.home),
              ),
              label: 'Home',
              //   title: Text(
              //   "Home",
              //   style: const TextStyle(color: Colors.white),
              // ),
            ),


            BottomNavigationBarItem(

              icon: Padding(
                child: Icon(Icons.search),

                padding: const EdgeInsets.only(top: 4.0),
              ),
              label: 'BMI',
              // title: Text(
              //   "BMI",
              //   style: const TextStyle(color: Colors.blueGrey),
              // ),

            ),


            BottomNavigationBarItem(
              icon: Padding(
                child: Icon(Icons.person),
                padding: const EdgeInsets.only(top: 4.0),
              ),
              label: 'Profile',
              // title: Text(
              //   "Profile",
              //   style: const TextStyle(color: Colors.white),
              // ),
            ),
          ],
        ),
      ),




      body: listScreens[tabIndex],
    );
  }
}
