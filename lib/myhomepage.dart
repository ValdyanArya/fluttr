import 'package:flutter/material.dart';
import 'page/favorite_page.dart';
import 'page/generator_page.dart';
import 'package:english_words/english_words.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // State yang mengharuskan penggunaan StatefulWidget
  var selectedIndex = 0;
  List<WordPair> likedWords = []; // List untuk menyimpan kata yang difavoritkan

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(likedWords: likedWords);
        break;
      case 1:
        page = FavoritePage(likedWords: likedWords);
        break;
      default:
        throw UnimplementedError('Tidak ada widget untuk $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Generator'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorite'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (val) {
                  setState(() {
                    selectedIndex = val;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}