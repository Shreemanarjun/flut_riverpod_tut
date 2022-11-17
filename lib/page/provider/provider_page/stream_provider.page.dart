import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<String>(
  (ref) => Stream.periodic(const Duration(seconds: 1), (i) => i.toString()),
);

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final stream = ref.watch(streamProvider);
            return stream.when(
              data: (value) => Text(value),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text(e.toString()),
            );
          },
        ),
      ),
    );
  }
}
