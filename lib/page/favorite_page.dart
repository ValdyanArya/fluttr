import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FavoritePage extends StatelessWidget {
  final List<WordPair> likedWords; // Menerima daftar kata yang difavoritkan

  FavoritePage({required this.likedWords});

  @override
  Widget build(BuildContext context) {
    // Filter hanya kata-kata yang ada di daftar yang disukai
    final favoriteWords = likedWords.toSet();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Page'),
      ),
      body: ListView.builder(
        itemCount: favoriteWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              favoriteWords.elementAt(index).asPascalCase,
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}