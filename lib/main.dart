import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/core/providers/theme_provider.dart';
import 'package:my_portfolio/core/route/app_router.dart';
import 'package:my_portfolio/core/theme/app_theme.dart';
import 'package:my_portfolio/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
