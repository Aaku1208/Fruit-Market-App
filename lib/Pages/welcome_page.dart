import 'package:flutter/material.dart';
import 'package:fruit_market2/Colors/color.dart';
import '../BottomNavigationBar/My Account/account_page.dart';
import '../BottomNavigationBar/Favorite/favorite_page.dart';
import '../BottomNavigationBar/Home/home_page.dart';
import '../BottomNavigationBar/Shopping Cart/shopping_cart.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;

  Future<bool> showExitPopup() async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit an App?'),
        elevation: 4,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 4,
                  minWidth: 80,
                  height: 33,
                  textColor: Colors.white,
                  color: myColor,

                  onPressed: () => Navigator.of(context).pop(true),

                  child: const Text('Yes'),
                ),
                MaterialButton(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  elevation: 4,
                  minWidth: 80,
                  height: 33,
                  textColor: Colors.white,
                  color: myColor,

                  onPressed: () => Navigator.of(context).pop(false),

                  child: const Text('No'),
                ),
              ],
            ),
          ),
        ],
      ),
    ) ??
        false;
  }



  @override
  Widget build(BuildContext context) {

    List _pages = [
     const HomePage(),
     const ShoppingPage(),
     const FavoritePage(),
     const AccountPage(),
    ];

    return WillPopScope(
      onWillPop: () { return showExitPopup(); },
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xff769E49),
          unselectedItemColor: const Color( 0xff838181),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,size: 30),
              label: 'Shopping cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined,size: 30),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,size: 30),
              label: 'My Account',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: OnItemTapped,
        ),
      ),
    );
  }
  Future OnItemTapped(int index) async {
    setState((){
      _selectedIndex = index;
    });
  }
}

