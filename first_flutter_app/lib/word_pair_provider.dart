import 'package:first_flutter_app_pt1/word_pair_bloc.dart';
import 'package:flutter/material.dart';

class WordPairProvider extends InheritedWidget {
  final WordPairBloc bloc;

  WordPairProvider({
    @required Widget child,
    @required this.bloc,
    Key key,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(WordPairProvider oldWidget) => oldWidget.bloc != bloc;

  static WordPairBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(WordPairProvider)
              as WordPairProvider)
          .bloc;
}
