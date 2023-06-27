import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:let_log/let_log.dart';

extension AutoDisposeRefCache on AutoDisposeRef {
  /// keeps the provider alive for [duration] since when it was first created
  /// (even if all the listeners are removed before then)
  void cacheFor({required Duration duration}) {
    final link = keepAlive();
    final timer = Timer(duration, () {
      link.close();
      Logger.log(
          "$runtimeType provider cached for ${duration.inSeconds} seconds is cleared");
    });
    onDispose(() => timer.cancel());
  }

  /// Automatically refresh after specified [duration]
  void autoRefresh({required Duration duration}) {
    final timer = Timer(duration, () {
      invalidateSelf();
      Logger.log(
          "$runtimeType provider cached for ${duration.inSeconds} seconds is refreshed");
    });
    onDispose(() => timer.cancel());
  }
}
