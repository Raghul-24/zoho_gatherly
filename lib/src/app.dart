import 'package:size_setter/size_setter.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

import '../src/localization/app_locallization.dart';
import 'package:flutter/material.dart';
import 'localization/languages.dart';
import 'routing/routes.dart' as routes;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SizeSetter(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales:
          Languages.languages.map((e) => Locale(e.code)).toList(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              },
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteColor,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          builder: (_, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                  textScaler: TextScaler.linear(data.textScaler.scale(data.textScaleFactor) > 1.0 ? 1.0 : data.textScaler.scale(1.0))),
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: child,
              ),
            );
          },
          onGenerateRoute: routes.onGenerateRoute,
        ),
    );
  }
}
