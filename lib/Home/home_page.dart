import 'package:edu_app/Home/navigaion/add_screen.dart';
import 'package:edu_app/Home/navigaion/download_screen.dart';
import 'package:edu_app/Home/navigaion/favorite_screen.dart';
import 'package:edu_app/Home/navigaion/home_screen.dart';
import 'package:edu_app/Home/navigaion/profile_screen.dart';
import 'package:edu_app/widges/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  final List<Map<String, Widget>> _pages = [
    {
      'page': const ProfileScreen(),
      // 'title': 'Spxer'
    },
    {
      'page': const FavoriteScreen(),
      // 'title': 'Activity'
    },
    {
      'page': const AddScreen(),
      // 'title': 'Live'
    },
    {
      'page': const DownloadScreen(),
      //'title': 'History'
    },
    {
      'page': const ProfileScreen(),
      // 'title': 'Profile'
    },
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Auth App"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => _signOut(
                context,
              ),
            )
          ],
        ),
        //drawer: const MyDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff3B485B),
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_rounded),
              label: "Live",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ));
  }
}
