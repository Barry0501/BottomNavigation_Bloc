import 'dart:async';

enum BottomBarItem { HOME, SHOPPING, PROFILE }

class BottomBarBloc {
  final StreamController<BottomBarItem> _bottomBarController =
      StreamController<BottomBarItem>.broadcast();
  Stream<BottomBarItem> get itemStream => _bottomBarController.stream;

  BottomBarItem defaultItem = BottomBarItem.HOME;

  void selectItem(int i) {
    switch (i) {
      case 0:
        _bottomBarController.sink.add(BottomBarItem.HOME);
        break;
      case 1:
        _bottomBarController.sink.add(BottomBarItem.SHOPPING);
        break;
      case 2:
        _bottomBarController.sink.add(BottomBarItem.PROFILE);
        break;
    }
  }

  void close() {
    _bottomBarController.close();
  }
}
