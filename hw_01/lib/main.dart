import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hw_01/models/theme_model.dart';
import 'package:hw_01/theme/themes.dart';
import 'package:provider/provider.dart';

import './router/app_router.dart';
import 'models/post_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => PostModel())],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeModel themeChangeProvider = ThemeModel();

  void getCurrentTheme() async {
    themeChangeProvider.setDarkTheme = (await themeChangeProvider.darkThemePrefs
        .getTheme());
  }

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: themeChangeProvider)],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp.router(
            routerConfig: appRouter,

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            themeMode: themeModel.getDarkTheme
                ? ThemeMode.dark
                : ThemeMode.light,

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          );
        },
      ),
    );
  }
}
