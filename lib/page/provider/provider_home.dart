import 'package:flut_riverpod_tut/page/provider/provider_page/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:flut_riverpod_tut/page/provider/provider_page/combined_provider_page.dart';
import 'package:flut_riverpod_tut/page/provider/provider_page/future_provider_page.dart';
import 'package:flut_riverpod_tut/page/provider/provider_page/scoped_provider_page.dart';
import 'package:flut_riverpod_tut/page/provider/provider_page/state_provider_page.dart';
import 'package:flut_riverpod_tut/page/provider/provider_page/stream_provider.page.dart';

class ProviderHome extends StatelessWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Providers'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                          builder: (context) => const ProviderPage(),
                        ),
                      );
                    },
                    child: const Text('Provider'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StateProviderPage(),
                      ),
                    );
                  },
                  child: const Text('StateProvider'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FutureProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Future Provider'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StreamProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Stream Provider'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScopedProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Scoped Provider'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CombinedProviderPage(),
                      ),
                    );
                  },
                  child: const Text('Combined Provider'),
                ),
              ),
            ],
          ),
        ));
  }
}
