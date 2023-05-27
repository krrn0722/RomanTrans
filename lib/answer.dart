import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'answer.g.dart';

@riverpod
class AnswerNotifier extends _$AnswerNotifier {
  @override
  int build() {
    // 最初のデータ
    return 777;
  }

  void transNum(String roman) {
    state = 1000;
  }
}
