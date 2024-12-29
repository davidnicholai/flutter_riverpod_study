import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/common_providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(sharedPreferencesProvider);
  });
  // all asynchronous app initialization code should belong here:
  await Future.delayed(const Duration(seconds: 2));
  await ref.watch(sharedPreferencesProvider.future);
}
