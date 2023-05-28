import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'roman_symbol.freezed.dart';
part 'roman_symbol.g.dart';

@freezed
class RomanSymbol with _$RomanSymbol {
  factory RomanSymbol({
    required int M,
    required int D,
    required int C,
    required int L,
    required int X,
    required int V,
    required int I,
  }) = _RomanSymbol;
}

@riverpod
class RomanSymbolNotifier extends _$RomanSymbolNotifier {
  @override
  RomanSymbol build() {
    return RomanSymbol(M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1);
  }
}
