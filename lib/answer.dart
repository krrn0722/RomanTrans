import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:roman_num/roman_symbol.dart';
part 'answer.g.dart';

@riverpod
class AnswerNotifier extends _$AnswerNotifier {
  @override
  int? build() {
    return null;
  }

  late final rSymProvider = ref.watch(romanSymbolNotifierProvider);

  void transNum(String roman) {
    //空ならnull
    if (roman.isEmpty) {
      state = null;
      return;
    }
    int sum = 0;
    int len = roman.length;
    //最後尾に空白を追加
    roman = roman.padRight(len + 1);

    //１文字づづ見ていく
    for (int i = 0; i < len; i++) {
      //Mのとき
      if (roman[i] == 'M') {
        sum += rSymProvider.M;
      }
      //Dのとき
      else if (roman[i] == 'D') {
        if (roman[i + 1] == 'M') {
          //#TODO エラー文表示
          print('異常表');
          state = null;
          return;
        } else {
          sum += rSymProvider.D;
        }
      }
      //Cのとき
      else if (roman[i] == 'C') {
        if (roman[i + 1] == 'D') {
          sum += rSymProvider.D - rSymProvider.C;
          i++;
        } else if (roman[i + 1] == 'M') {
          sum += rSymProvider.M - rSymProvider.C;
          i++;
        } else {
          sum += rSymProvider.C;
        }
      }
      //Lのとき
      else if (roman[i] == 'L') {
        if (roman[i + 1] == 'C' || roman[i + 1] == 'D' || roman[i + 1] == 'M') {
          //#TODO エラー文表示
          print('異常表');
          state = null;
          return;
        } else {
          sum += rSymProvider.L;
        }
      }
      //Xのとき
      else if (roman[i] == 'X') {
        if (roman[i + 1] == 'D' || roman[i + 1] == 'M') {
          //#TODO エラー文表示
          print('異常表');
          state = null;
          return;
        } else if (roman[i + 1] == 'L') {
          sum += rSymProvider.L - rSymProvider.X;
          i++;
        } else if (roman[i + 1] == 'C') {
          sum += rSymProvider.C - rSymProvider.X;
          i++;
        } else {
          sum += rSymProvider.X;
        }
      }
      //Vのとき
      else if (roman[i] == 'V') {
        if (roman[i + 1] == 'X' ||
            roman[i + 1] == 'L' ||
            roman[i + 1] == 'C' ||
            roman[i + 1] == 'D' ||
            roman[i + 1] == 'M') {
          //#TODO エラー文表示
          print('異常表');
          state = null;
          return;
        } else {
          sum += rSymProvider.V;
        }
      }
      //Iのとき
      else if (roman[i] == 'I') {
        if (roman[i + 1] == 'L' ||
            roman[i + 1] == 'C' ||
            roman[i + 1] == 'D' ||
            roman[i + 1] == 'M') {
          //#TODO エラー文表示
          print('異常表');
          state = null;
          return;
        } else if (roman[i + 1] == 'V') {
          sum += rSymProvider.V - rSymProvider.I;
          i++;
        } else if (roman[i + 1] == 'X') {
          sum += rSymProvider.X - rSymProvider.I;
          i++;
        } else {
          sum += rSymProvider.I;
        }
      }
      //定義されていない文字の時
      else {
        //#TODO エラー文表示
        print('ローマ数じゃないよ');
        state = null;
        return;
      }
      //最後の文字だけ次の文字を確認しない
    }
    state = sum;
  }
}
