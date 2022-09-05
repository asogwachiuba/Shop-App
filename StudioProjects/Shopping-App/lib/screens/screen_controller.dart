import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/navigation/shopping_pages.dart';
import 'package:shopping_app/screens/details_screen.dart';
import 'package:shopping_app/screens/favorite_screen.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/login_screen.dart';
import 'package:shopping_app/screens/my_cart_screen.dart';
import 'package:shopping_app/screens/my_profile_screen.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/screens/welcome_screen.dart';

import '../app_state_manager.dart';
import 'AppData.dart';

class ScreenController extends StatefulWidget {
  static MaterialPage page(int currentTab)  {
    return MaterialPage(
        name: ShoppingPages.home,
        key: ValueKey(ShoppingPages.home),
        child: ScreenController(
      selectedTab: currentTab,
    ));
  }
  const ScreenController({
    required this.selectedTab,
    Key? key}) : super(key: key);
  final int selectedTab;

  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
// list of screens available
  List<Widget> screens = <Widget>[
    Home(),
    FavoriteScreen(),
    MyCartScreen(),
    MyProfileScreen()
    //DetailsScreen(item:  Items(name: 'Soccer Ball', image: 'soccer ball.jpg', numbers_in_stock: 5, price: 5000, category: 'Sports', name_of_list: 'Special Offer List',),
    //),
  ];
// a void function that updates _selectedscreen variable
  void _updateScreen(int index){
    Provider.of<AppStateManager>(context, listen: false)
        .goToHomeTab(index);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (
        context,
        appStateManager,
        child,
    )
    {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shopping App'),
        ),
        body: screens[widget.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          currentIndex: widget.selectedTab,
          onTap: _updateScreen,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: 'Explore'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: 'Favorites'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_sharp),
                label: 'My Cart'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_outlined),
                label: 'My Profile'
            ),
          ],
        ),
      );
    });
  }
}
