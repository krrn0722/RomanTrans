import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roman_num/answer.dart';
import 'package:roman_num/error.dart';
import 'package:roman_num/use_l10n.dart';

class CalculatePage extends HookConsumerWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final ansProvider = ref.watch(answerNotifierProvider);
    final ansNotifier = ref.read(answerNotifierProvider.notifier);
    final errorProvider = ref.watch(errorNotifierProvider);
    final l10n = useL10n();
    return Scaffold(
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.romanNum,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(200, 40, 40, 40)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: l10n.enterRomanNum,
                    hintStyle: const TextStyle(fontSize: 20)),
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
                child: Text(l10n.translate)),
            SizedBox(height: 40),
            Text(l10n.result,
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
                null => SingleChildScrollView(
                    child: Text(
                      '$errorProvider',
                      style: const TextStyle(fontSize: 20),
                      overflow: TextOverflow.visible,
                    ),
                  ),
              },
            )
          ],
        ),
      ),
    ));
  }
}
