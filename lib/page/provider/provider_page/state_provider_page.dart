import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statePRovider = StateProvider<int>((ref) => 0);

class StateProviderPage extends StatelessWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build StateProviderPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              final provider = ref.read(statePRovider.notifier);

              provider.state++;
            },
            child: const Icon(Icons.add),
          );
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer(builder: (context, ref, _) {
                return Text(
                  '${ref.watch(statePRovider)}',
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



