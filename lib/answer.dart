import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer.g.dart';

@riverpod
class AnswerNotifier extends _$AnswerNotifier {
  @override
  int? build() {
    return null;
  }

  void transNum(String roman) {
    state = 1000;
  }
}
