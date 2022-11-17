import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scopeProvider = StateProvider<int>((ref) => 0);

final likeStatePod = StateProvider(
  (ref) => false,
);

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
          Consumer(
            builder: (context, ref, child) {
              return Switch(
                value: ref.watch(likeStatePod),
                onChanged: (value) {
                  ref.read(likeStatePod.notifier).update((state) => !state);
                },
              );
            },
          )
        ],
      )),
    );
  }

  Widget buildScoped([int? value]) {
    final consumer = Consumer(
      builder: (context, ref, child) {
        final number = ref.watch(scopeProvider).toString();
        return InkWell(
            onTap: () {
              ref.read(scopeProvider.notifier).update((state) {
                if (value != null) {
                  if (value + 1 > state) {
                    return state + 1;
                  }
                }
                return state;
              });
            },
            child: Text(
              number,
              style: const TextStyle(fontSize: 30),
            ));
      },
    );
    if (value != null) {
      return ProviderScope(
        overrides: [
          scopeProvider.overrideWith(
            (ref) => value,
          ),
        ],
        child: consumer,
      );
    } else {
      return consumer;
    }
  }
}
