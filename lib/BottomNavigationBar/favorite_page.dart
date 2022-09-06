import 'package:flutter/material.dart';
import '../Colors/color.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: myColor,
          title: Text("Favorite"),
        ),
        body: Center(
          child: Text("Under Production"),
        ),
    );
  }
}
