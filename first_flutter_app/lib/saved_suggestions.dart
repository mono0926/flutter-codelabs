import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedSuggestions extends StatelessWidget {
  final Set<WordPair> saved;

  const SavedSuggestions({
    @required this.saved,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map(
      (pair) => ListTile(
            title: Text(
              pair.asPascalCase,
              style: Theme.of(context).textTheme.display1,
            ),
          ),
    );
    final divided = ListTile.divideTiles(
      tiles: tiles,
      context: context,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}
