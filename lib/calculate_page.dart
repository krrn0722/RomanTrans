import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatePage extends HookConsumerWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState('');
    final controller = useTextEditingController();
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
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '整数を入力して'),
            ),
            ElevatedButton(
                onPressed: () {
                  text.value = controller.text;
                  print('a');
                },
                child: Text("計算")),
            Text(
              text.value,
            ),
          ],
        ),
      ),
    );
  }
}
