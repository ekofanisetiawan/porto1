import 'package:flutter/material.dart';
import 'package:sutori_app/add_story_screen.dart';
import 'package:sutori_app/info_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: Center(
            child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text('Attention!'),
                      content: const Text('Please Upload A New Story'),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Oke'))
                      ]);
                });
          },
          child: const Text(
            'Welcome to The Yokmeet App!\n Please Upload A New Story',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF014D4E)),
          ),
        )),
        drawer: _drawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Story',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddStoryScreen()));
          },
          backgroundColor: Color.fromARGB(255, 3, 36, 36),
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        // bottomNavigationBar: BottomAppBar(
        //     color: Color(0xFF014D4E),
        //     shape: CircularNotchedRectangle(),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         IconButton(
        //             onPressed: () {},
        //             icon: const Icon(Icons.home,
        //                 color: Color.fromRGBO(43, 217, 254, 1.0))),
        //         IconButton(
        //             onPressed: () {},
        //             icon: const Icon(Icons.favorite, color: Colors.red))
        //       ],
        bottomNavigationBar: _bottomNavigationBar());
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Color(0xFF014D4E),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 211, 202, 202),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ]);
  }

  Drawer _drawer() {
    return Drawer(
      // child: Container(
      // color: Color.fromARGB(255, 0, 44, 45),
      child: ListView(
        children: const [
          DrawerHeader(
              child: Text(
            'App Info',
            style: TextStyle(
                color: Color(0xFF014D4E),
                fontWeight: FontWeight.bold,
                fontSize: 21),
          )),
          ListTile(
            leading: Icon(Icons.account_circle, color: Color(0xFF014D4E)),
            title: Text(
              'Profile',
              style: TextStyle(color: Color(0xFF014D4E)),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: Color(0xFF014D4E),
            ),
            title: Text('Bookmark', style: TextStyle(color: Color(0xFF014D4E))),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xFF014D4E),
            ),
            title: Text(
              'Setting',
              style: TextStyle(color: Color(0xFF014D4E)),
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        // backgroundColor: Color(0xFF014D4E),
        iconTheme: const IconThemeData(color: Color(0xFF014D4E)),
        title: const Text(
          'Yokmeet',
          style: TextStyle(
              color: Color(0xFF014D4E),
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xFF014D4E),
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoDetailScreen()));
              },
              icon: const Icon(
                Icons.info,
                color: Color(0xFF014D4E),
              ))
        ]);
  }
}
