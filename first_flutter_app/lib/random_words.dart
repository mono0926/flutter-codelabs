import 'package:english_words/english_words.dart';
import 'package:first_flutter_app_pt1/saved_suggestions.dart';
import 'package:first_flutter_app_pt1/word_pair_bloc.dart';
import 'package:first_flutter_app_pt1/word_pair_provider.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () => _pushSaved(context),
            )
          ],
        ),
        body: _buildSuggestions(context),
      );

  Widget _buildSuggestions(BuildContext context) {
    final bloc = WordPairProvider.of(context);
    return StreamBuilder<List<WordPair>>(
        initialData: [],
        stream: bloc.suggestions,
        builder: (context, snap) {
          final suggestions = snap.data;
          return ListView.builder(
            itemCount: suggestions.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, i) {
              print(i);
              if (i >= suggestions.length - 1) {
                bloc.suggestionsAddition
                    .add(generateWordPairs().take(10).toList());
              }
              return _buildRow(context, suggestions[i]);
            },
          );
        });
  }

  Widget _buildRow(BuildContext context, WordPair pair) {
    final bloc = WordPairProvider.of(context);
    return Column(
      children: <Widget>[
        StreamBuilder<Set<WordPair>>(
            initialData: Set<WordPair>(),
            stream: bloc.saved,
            builder: (context, snap) {
              final alreadySaved = snap.data.contains(pair);
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: Theme.of(context).textTheme.display1,
                ),
                trailing: Icon(
                  alreadySaved ? Icons.favorite : Icons.favorite_border,
                  color: alreadySaved ? Colors.red : null,
                ),
                onTap: () {
                  bloc.save.add(
                      WordPairUpdateInfo(wordPair: pair, save: !alreadySaved));
                },
              );
            }),
        Divider(
          height: 0.0,
        )
      ],
    );
  }

  void _pushSaved(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_context) => SavedSuggestions(),
      ),
    );
  }
}
