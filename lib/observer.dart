import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    if (newValue is StateController) {
      final newv = newValue.state;
      final perviousv = (previousValue as StateController).state;
      debugPrint('Provider is: '
          '${provider.name ?? provider.runtimeType} \n'
          'new value: $newv\n'
          'previous value: $perviousv');
    } else if (newValue is AsyncValue) {
      final newv = newValue.value;
      final perviousv = (previousValue as AsyncValue).value;
      debugPrint('Provider is: '
          '${provider.name ?? provider.runtimeType} \n'
          'new value: $newv\n'
          'previous value: $perviousv');
    } else {
      debugPrint('Provider is: '
          '${provider.name ?? provider.runtimeType} \n'
          'new value: ${newValue.toString()}\n'
          'previous value: ${previousValue.toString()}');
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
