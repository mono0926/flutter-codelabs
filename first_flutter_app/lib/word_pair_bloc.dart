import 'package:english_words/english_words.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class WordPairBloc {
  WordPairBloc() {
    _suggestionsAddition.stream
        .transform(ScanStreamTransformer<List<WordPair>, List<WordPair>>(
            (cache, pairs, index) {
          cache.addAll(pairs);
          return cache;
        }, <WordPair>[]))
        .pipe(suggestions);

    _save.stream
        .transform(ScanStreamTransformer<WordPairUpdateInfo, Set<WordPair>>(
            (cache, info, index) {
          if (info.save) {
            cache.add(info.wordPair);
          } else {
            cache.remove(info.wordPair);
          }
          return cache;
        }, Set<WordPair>()))
        .pipe(saved);

    suggestionsAddition.add(generateWordPairs().take(10).toList());
  }

  final suggestions = BehaviorSubject<List<WordPair>>();
  final saved = BehaviorSubject<Set<WordPair>>();

  Sink<List<WordPair>> get suggestionsAddition => _suggestionsAddition.sink;

  Sink<WordPairUpdateInfo> get save => _save.sink;

  final _suggestionsAddition = PublishSubject<List<WordPair>>();
  final _save = PublishSubject<WordPairUpdateInfo>();

//  Stream<List<WordPair>> get suggestions => ;

  dispose() {
    suggestions.close();
    _suggestionsAddition.close();
    _save.close();
    saved.close();
  }
}

class WordPairUpdateInfo {
  final WordPair wordPair;
  final bool save;

  WordPairUpdateInfo({
    @required this.wordPair,
    @required this.save,
  });
}
