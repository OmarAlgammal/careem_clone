import 'package:careem_clone/controller/auth_cubit/app_theme/app_theme_providerr.dart';
import 'package:careem_clone/helpers/timer_notifier.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

init() {
  /// TODO: Add timer in seconds to a public static value
  locator.registerLazySingleton(() => TimerNotifier(timerInSeconds: 30));
  locator.registerLazySingleton(() => AppThemeProvider());
}
