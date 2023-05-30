import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:roman_num/error.dart';
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
    final errorNotifier = ref.read(errorNotifierProvider.notifier);
    //空ならnull
    if (roman.isEmpty) {
      state = null;
      errorNotifier.assign('');
      return;
    }
    //文字の前後にある空白を取り除く
    roman = roman.trim();
    int sum = 0;
    int len = roman.length;
    int mTimes = 0,
        dTimes = 0,
        cTimes = 0,
        lTimes = 0,
        xTimes = 0,
        vTimes = 0,
        iTimes = 0;
    //小文字を大文字に変換する
    roman = roman.toUpperCase();
    //最後尾に空白を追加
    roman = roman.padRight(len + 1);
    roman = roman.padRight(len + 2);

    //１文字づづ見ていく
    for (int i = 0; i < len; i++) {
      //Mのとき
      if (roman[i] == 'M') {
        sum += rSymProvider.M;
        mTimes++;
      }
      //Dのとき
      else if (roman[i] == 'D') {
        if (roman[i + 1] == 'M') {
          //異常表が起こった場合のエラー
          errorNotifier.assign('規則に反するローマ数字です');
          state = null;
          return;
        } else {
          sum += rSymProvider.D;
          dTimes++;
        }
      }
      //Cのとき
      else if (roman[i] == 'C') {
        if (roman[i + 1] == 'D') {
          sum += rSymProvider.D - rSymProvider.C;
          if (roman[i + 2] == 'C' ||
              roman[i + 2] == 'M' ||
              roman[i + 2] == 'D') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            state = null;
            return;
          }
          i++;
        }
        //Mのとき
        else if (roman[i + 1] == 'M') {
          sum += rSymProvider.M - rSymProvider.C;
          if (roman[i + 2] == 'M' ||
              roman[i + 2] == 'D' ||
              roman[i + 2] == 'C') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            state = null;
            return;
          }
          i++;
        } else {
          sum += rSymProvider.C;
          cTimes++;
        }
      }
      //Lのとき
      else if (roman[i] == 'L') {
        if (roman[i + 1] == 'C' || roman[i + 1] == 'D' || roman[i + 1] == 'M') {
          //異常表が起こった場合のエラー
          errorNotifier.assign('規則に反するローマ数字です');
          state = null;
          return;
        } else {
          sum += rSymProvider.L;
          lTimes++;
        }
      }
      //Xのとき
      else if (roman[i] == 'X') {
        if (roman[i + 1] == 'D' || roman[i + 1] == 'M') {
          //異常表が起こった場合のエラー
          errorNotifier.assign('規則に反するローマ数字です');
          state = null;
          return;
        } else if (roman[i + 1] == 'L') {
          sum += rSymProvider.L - rSymProvider.X;
          if (roman[i + 2] == 'X' ||
              roman[i + 2] == 'L' ||
              roman[i + 2] == 'C' ||
              roman[i + 2] == 'D' ||
              roman[i + 2] == 'M') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            state = null;
            return;
          }
          i++;
        } else if (roman[i + 1] == 'C') {
          sum += rSymProvider.C - rSymProvider.X;
          if (roman[i + 2] == 'X' ||
              roman[i + 2] == 'L' ||
              roman[i + 2] == 'C' ||
              roman[i + 2] == 'D' ||
              roman[i + 2] == 'M') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            state = null;
            return;
          }
          i++;
        } else {
          sum += rSymProvider.X;
          xTimes++;
        }
      }
      //Vのとき
      else if (roman[i] == 'V') {
        if (roman[i + 1] == 'X' ||
            roman[i + 1] == 'L' ||
            roman[i + 1] == 'C' ||
            roman[i + 1] == 'D' ||
            roman[i + 1] == 'M') {
          //異常表が起こった場合のエラー
          errorNotifier.assign('規則に反するローマ数字です');
          state = null;
          return;
        } else {
          sum += rSymProvider.V;
          vTimes++;
        }
      }
      //Iのとき
      else if (roman[i] == 'I') {
        if (roman[i + 1] == 'L' ||
            roman[i + 1] == 'C' ||
            roman[i + 1] == 'D' ||
            roman[i + 1] == 'M') {
          //異常表が起こった場合のエラー
          errorNotifier.assign('規則に反するローマ数字です');
          state = null;
          return;
        } else if (roman[i + 1] == 'V') {
          sum += rSymProvider.V - rSymProvider.I;
          if (roman[i + 2] == 'I' ||
              roman[i + 2] == 'V' ||
              roman[i + 2] == 'X' ||
              roman[i + 2] == 'L' ||
              roman[i + 2] == 'C' ||
              roman[i + 2] == 'D' ||
              roman[i + 2] == 'M') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            state = null;
            return;
          }
          i++;
        } else if (roman[i + 1] == 'X') {
          sum += rSymProvider.X - rSymProvider.I;
          if (roman[i + 2] == 'I' ||
              roman[i + 2] == 'V' ||
              roman[i + 2] == 'X' ||
              roman[i + 2] == 'L' ||
              roman[i + 2] == 'C' ||
              roman[i + 2] == 'D' ||
              roman[i + 2] == 'M') {
            //異常表が起こった場合のエラー
            errorNotifier.assign('規則に反するローマ数字です');
            print('異常表');
            state = null;
            return;
          }
          i++;
        } else {
          sum += rSymProvider.I;
        }
      } //定義されていない文字の時
      else {
        //定義されていない文字のエラー
        errorNotifier.assign('ローマ数字ではありません');
        state = null;
        return;
      }
      //４回以上繰り返すと
      print(mTimes);
      if (mTimes >= 4 ||
          dTimes >= 4 ||
          cTimes >= 4 ||
          lTimes >= 4 ||
          xTimes >= 4 ||
          vTimes >= 4 ||
          iTimes >= 4) {
        //異常表が起こった場合のエラー
        errorNotifier.assign('規則に反するローマ数字です');
        state = null;
        return;
      }
    }
    state = sum;
  }
}
