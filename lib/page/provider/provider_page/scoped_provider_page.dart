import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scopeProvider = Provider<int>((ref) => 0);

class ScopedProviderPage extends StatelessWidget {
  const ScopedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build ScopedProviderPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scoped Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          buildScoped(42),
          buildScoped(90),
          buildScoped(),
        ],
      )),
    );
  }

  Widget buildScoped([int? value]) {
    final consumer = Consumer(
      builder: (context, ref, child) {
        final number = ref.watch(scopeProvider).toString();
        return Text(number);
      },
    );
    return value != null
        ? ProviderScope(
            overrides: [
              scopeProvider.overrideWithValue(value),
            ],
            child: consumer,
          )
        : consumer;
  }
}
