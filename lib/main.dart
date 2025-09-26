import 'package:dartcoder/services/cache_service.dart';
import 'package:dartcoder/shared/navigation/router.dart';
import 'package:dartcoder/shared/text_editor.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';

final isDarkTheme = ValueNotifier<bool>(true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cacheService.init();
  runApp(
    ValueListenableBuilder(
        valueListenable: isDarkTheme,
        builder: (_, isDark, __) {
          return MaterialApp(
            navigatorKey: AppRouter.navKey,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRouter.home,
          );
        }),
  );
}

final cacheService = CacheService();

final editor = TextEditor(cacheService: cacheService);
