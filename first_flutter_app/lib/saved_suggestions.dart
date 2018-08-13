import 'package:english_words/english_words.dart';
import 'package:first_flutter_app_pt1/word_pair_provider.dart';
import 'package:flutter/material.dart';

class SavedSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = WordPairProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: StreamBuilder<Set<WordPair>>(
        stream: bloc.saved,
        initialData: Set<WordPair>(),
        builder: (context, snap) {
          final tiles = snap.data.map(
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
          return ListView(
            children: divided,
          );
        },
      ),
    );
  }
}
