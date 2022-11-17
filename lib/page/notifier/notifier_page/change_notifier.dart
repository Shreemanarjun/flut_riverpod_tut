import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarNotifier extends ChangeNotifier {
  int _speed = 120;
  void increaseSpeed() {
    _speed += 5;
    notifyListeners();
  }

  void hitBreak() {
    _speed = max(0, _speed - 30);
    notifyListeners();
  }
  

  @override
  String toString() => 'CarNotifier(_speed: $_speed)';
}

final carProvider = ChangeNotifierProvider<CarNotifier>((ref) => CarNotifier());

class ChangeNotifierView extends StatelessWidget {
  const ChangeNotifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final car = ref.watch(carProvider);
              return Text('Speed:${car._speed}',
                  style: const TextStyle(fontSize: 30));
            }),
            const SizedBox(
              height: 8,
            ),
            Consumer(
              builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        ref.read(carProvider).increaseSpeed();
                      },
                      child: const Text('Increase Speed +5'),
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed: () {
                        ref.read(carProvider).hitBreak();
                      },
                      child: const Text('Hit Break -30'),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
