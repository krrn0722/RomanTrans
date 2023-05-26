import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class CalculatePage extends StatelessWidget {
  const CalculatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              L10n.of(context)!.hello,
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: '整数を入力して'),
            ),
            ElevatedButton(onPressed: () {}, child: Text("計算")),
            Text(
              "答えが来るよ",
            ),
          ],
        ),
      ),
    );
  }
}
