import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roman_num/answer.dart';

class CalculatePage extends HookConsumerWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final ansProvider = ref.watch(answerNotifierProvider);
    final ansNotifier = ref.read(answerNotifierProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              L10n.of(context)!.hello,
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: '整数を入力して'),
              maxLength: 21,
            ),
            ElevatedButton(
                onPressed: () {
                  ansNotifier.transNum(controller.text);
                },
                child: Text('計算')),
            //数字がヌルの場合は空のコンテナ
            switch (ansProvider) {
              int() => Text('$ansProvider'),
              null => SizedBox(),
            }
          ],
        ),
      ),
    );
  }
}
