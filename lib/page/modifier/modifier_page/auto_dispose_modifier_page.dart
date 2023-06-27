import 'dart:math';

import 'package:flut_riverpod_tut/pod_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchValue(int value) async {
  await Future.delayed(const Duration(seconds: 1));
  if (value == 1) {
    throw "error";
  } else {
    return value.toString();
  }
  // return 'State will be disposed';
}

final futureProvider = FutureProvider.autoDispose<String>((ref) async {
  ref.autoRefresh(duration: const Duration(seconds: 5));
  try {
    int random = Random().nextBool() ? 1 : 0;
    print("random value $random");
    final value = await fetchValue(random);

    return value;
  } catch (e) {
    throw e.toString();
  }
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
