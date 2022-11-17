import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = Provider((ref) => 0);

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build provider');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(builder: (context, ref, child) {
                return Text(
                  '${ref.watch(provider)}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
