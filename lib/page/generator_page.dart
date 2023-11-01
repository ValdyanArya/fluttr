import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class GeneratorPage extends StatefulWidget {
  final List<WordPair> likedWords; // Menerima daftar kata yang difavoritkan
  GeneratorPage({required this.likedWords});

  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  List<WordPair> historyWords = [];
  int maxHistoryLength = 5; // Batasi jumlah nama yang ditampilkan
  WordPair wordPair = WordPair.random(); // Kata acak awal

  void _generateRandomWord() {
    final newWord = WordPair.random();
    setState(() {
      if (historyWords.length >= maxHistoryLength) {
        // Hapus nama yang terlama jika sudah mencapai batas
        historyWords.removeAt(0);
      }
      historyWords.add(newWord);
      wordPair = newWord; // Menghasilkan kata acak baru
    });
  }

  void _toggleLike() {
    setState(() {
      if (widget.likedWords.contains(wordPair)) {
        widget.likedWords.remove(wordPair);
      } else {
        widget.likedWords.add(wordPair);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLiked = widget.likedWords.contains(wordPair);
    return Scaffold(
      body: Container(
        color:
            Color.fromARGB(255, 255, 173, 126), // Warna latar belakang coklat
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: historyWords.map((item) {
                  final isItemLiked = widget.likedWords.contains(item);
                  return ListTile(
                    leading: isItemLiked
                        ? Icon(Icons.favorite, color: Colors.red)
                        : null,
                    title: Text(
                      item.asPascalCase,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Warna teks putih
                      ),
                    ),
                  );
                }).toList(),
              ),
              Container(
                color: Colors.brown, // Warna latar belakang hitam
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  wordPair.asPascalCase,
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.black, // Warna teks putih
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      _toggleLike();
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : null,
                    ),
                    label: Text('Like'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Warna latar belakang tombol
                    ),
                  ),
                  SizedBox(width: 16), // Spasi antara tombol
                  ElevatedButton(
                    onPressed: () {
                      _generateRandomWord();
                    },
                    child: Text('Next'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Warna latar belakang tombol
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}