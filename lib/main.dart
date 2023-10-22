import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9_mon/MyThemeData.dart';
import 'package:islami_c9_mon/chapterDetails/ChapterDetailsScreen.dart';
import 'package:islami_c9_mon/hadethDetails/HadethDetailsScreen.dart';
import 'package:islami_c9_mon/home/HomeScreen.dart';
import 'package:islami_c9_mon/providers/SettingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<SettingsProvider>(context);
    initSharedPrefs();
    return MaterialApp(
      title: 'Islami Omar Application',
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.currentTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        ChapterDetailsScreen.routeName: (_) => ChapterDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLocale),
    );
  }

  initSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('lang') ?? "en";
    String theme = prefs.getString('theme') ?? 'light';
    provider.changeLocale(lang);
    if (theme == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
