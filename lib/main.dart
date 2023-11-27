import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mars_app/data/db/init_hive.dart';
import 'package:mars_app/utils/resources/cubit_observer.dart';
import 'package:mars_app/utils/resources/router_manger.dart';
import 'package:mars_app/utils/resources/string_manger.dart';
import 'package:sizer/sizer.dart';
import 'generated/l10n.dart';
import 'package:mars_app/utils/resources/color_manger.dart';
import 'package:mars_app/utils/resources/theme_manger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(StringManger.onpenBox).listenable(),
        builder: (_, box, __) {
          final bool isDark = Hive.box(StringManger.onpenBox)
              .get(StringManger.isDark, defaultValue: false);
          final String lag = Hive.box(StringManger.onpenBox)
              .get(StringManger.lag, defaultValue: StringManger.en);
          return Sizer(builder: (buildContext, orientation, deviceType) {
            return MaterialApp.router(
              routerConfig: router(),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(lag),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: lightColorScheme,
                useMaterial3: true,
                textTheme: TextTheme(
                  bodySmall: textTheme.bodySmall,
                ),
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                useMaterial3: true,
                textTheme: TextTheme(bodySmall: textTheme.bodySmall),
              ),
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            );
          });
        });
  }
}
