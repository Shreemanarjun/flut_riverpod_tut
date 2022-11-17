import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider.autoDispose((ref) async {
  final value = await fetchWeather();
  ref.maintainState = true;
  return value;
});

Future<int> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 5));
  return 20;
}

class FutureProviderPage extends StatelessWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build Future ProviderPage');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: Center(child: Consumer(builder: (context, ref, _) {
          final future = ref.watch(futureProvider);
          return future.when(
              data: (value) => Text(value.toString()),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text(e.toString()));
        })));
  }
}
