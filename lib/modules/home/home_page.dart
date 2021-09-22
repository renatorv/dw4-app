import 'package:app_filmes/ui/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
          BottomNavigationBarItem(
              icon: Icon(FilmesAppIcons.heart_empty), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined), label: 'Sair'),
        ],
      ),
      body: Container(),
    );
  }
}
