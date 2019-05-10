import 'package:bottomnavigation_bloc/bottom_bloc.dart';
import 'package:flutter/material.dart';

class BottomBarApp extends StatefulWidget {
  @override
  _BottomBarAppState createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
  BottomBarBloc _bottomBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomBarBloc = BottomBarBloc();
  }

  @override
  void dispose() {
    _bottomBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: StreamBuilder<BottomBarItem>(
          stream: _bottomBarBloc.itemStream,
          initialData: _bottomBarBloc.defaultItem,
          builder:
              (BuildContext context, AsyncSnapshot<BottomBarItem> snapshot) {
            switch (snapshot.data) {
              case BottomBarItem.HOME:
                return _homeArea();
              case BottomBarItem.SHOPPING:
                return _shoppingArea();
              case BottomBarItem.PROFILE:
                return _profileArea();
            }
          },
        ),
        bottomNavigationBar: StreamBuilder(
          stream: _bottomBarBloc.itemStream,
          initialData: _bottomBarBloc.defaultItem,
          builder:
              (BuildContext context, AsyncSnapshot<BottomBarItem> snapshot) {
            return BottomNavigationBar(
              fixedColor: Colors.blueAccent,
              currentIndex: snapshot.data.index,
              onTap: _bottomBarBloc.selectItem,
              items: [
                BottomNavigationBarItem(
                  title: Text('Home'),
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  title: Text('Shopping'),
                  icon: Icon(Icons.shopping_cart),
                ),
                BottomNavigationBarItem(
                  title: Text('Profile'),
                  icon: Icon(Icons.person),
                ),
              ],
            );
          },
        )
      );
  }
}

Widget _homeArea() {
  return Center(
    child: Text(
      'Home Screen',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.green,
        fontSize: 25.0,
      ),
    ),
  );
}

Widget _shoppingArea() {
  return Center(
    child: Text(
      'Shopping Screen',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.red,
        fontSize: 25.0,
      ),
    ),
  );
}

Widget _profileArea() {
  return Center(
    child: Text(
      'Profile Screen',
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.blue,
        fontSize: 25.0,
      ),
    ),
  );
}
