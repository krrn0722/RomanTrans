import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roman_num/answer.dart';
import 'package:roman_num/error.dart';

class CalculatePage extends HookConsumerWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final ansProvider = ref.watch(answerNotifierProvider);
    final ansNotifier = ref.read(answerNotifierProvider.notifier);
    final errorProvider = ref.watch(errorNotifierProvider);
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ローマ数字',
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(200, 40, 40, 40)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'ローマ数字を入力してください'),
                style: const TextStyle(fontSize: 30),
                maxLength: 21,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(200)),
                onPressed: () {
                  ansNotifier.transNum(controller.text);
                },
                child: Text('変換')),
            SizedBox(height: 40),
            Text('結果',
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(200, 40, 40, 40))),
            //数字がヌルの場合はエラー文
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 300,
              height: 80,
              padding: EdgeInsets.all(20),
              child: switch (ansProvider) {
                int() =>
                  Text('$ansProvider', style: const TextStyle(fontSize: 30)),
                null =>
                  Text('$errorProvider', style: const TextStyle(fontSize: 30)),
              },
            )
          ],
        ),
      ),
    ));
  }
}
