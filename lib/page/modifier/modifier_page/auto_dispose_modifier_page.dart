import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchValue() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'State will be disposed';
}

final futureProvider = FutureProvider.autoDispose<String>((ref) {
  ref.onDispose(() {
    print('disposed');
  });
  return fetchValue();
});

class AutoDisposeModifierPage extends ConsumerWidget {
  const AutoDisposeModifierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final future = ref.watch(futureProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('AutoDisposeModifier'),
        ),
        body: Center(
          child: future.when(
            data: (d) => Text(d),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
