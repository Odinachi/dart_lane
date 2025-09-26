import 'package:dartcoder/firebase_options.dart';
import 'package:dartcoder/services/cache_service.dart';
import 'package:dartcoder/shared/navigation/router.dart';
import 'package:dartcoder/shared/text_editor.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final isDarkTheme = ValueNotifier<bool>(true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await cacheService.init();
  runApp(
    ValueListenableBuilder(
        valueListenable: isDarkTheme,
        builder: (_, isDark, __) {
          return ScreenUtilInit(
            builder: (context, child) => MaterialApp(
              navigatorKey: AppRouter.navKey,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              theme: lightTheme,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.generateRoute,
              initialRoute: AppRouter.onboarding,
            ),
          );
        }),
  );
}

final cacheService = CacheService();

final editor = TextEditor(cacheService: cacheService);
