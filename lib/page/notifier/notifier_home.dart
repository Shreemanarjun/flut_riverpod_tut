import 'package:flut_riverpod_tut/page/notifier/notifier_page/change_notifier.dart';
import 'package:flut_riverpod_tut/page/notifier/notifier_page/state_notifier.dart';
import 'package:flutter/material.dart';

class NotifierHome extends StatelessWidget {
  const NotifierHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Notifier'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StateNotifierView(),
                      ),
                    );
                  },
                  child: const Text('Sate Notifier Provider'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeNotifierView(),
                      ),
                    );
                  },
                  child: const Text('Change Notifier Provider'),
                ),
              ),
            ),
          ],
        ));
  }
}
