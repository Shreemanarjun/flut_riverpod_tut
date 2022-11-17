import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = StateProvider<String>((ref) => 'Munich2');

Future<int> fetchWeather(String city) async {
  await Future.delayed(const Duration(seconds: 1));
  return city == 'Munich' ? 20 : 15;
}

final futureProvider = FutureProvider((ref) async {
  final city = ref.watch(cityProvider);
  return fetchWeather(city);
});

class CombinedProviderPage extends StatelessWidget {
  const CombinedProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build CombinedProviderPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(builder: (context, ref, _) {
              final future = ref.watch(futureProvider);

              return future.when(
                  data: (value) => Text(value.toString()),
                  loading: () => const CircularProgressIndicator(),
                  error: (e, s) => Text(e.toString()));
            }),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                    onPressed: () {
                      var state = ref.read(cityProvider.notifier).state;
                      print(state);
                      if (state == "Munich2") {
                        ref.read(cityProvider.notifier).state = 'Munich';
                      } else if (state == "Munich") {
                        ref.read(cityProvider.notifier).state = 'Munich2';
                      } else {
                        ref.read(cityProvider.notifier).state == "Munich2";
                      }
                    },
                    child: const Text('Change City'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
