import 'package:flutter/material.dart';
import 'package:gallery_app_1/helpers/theme_controller.dart';
import 'package:gallery_app_1/views/screens/homepage.dart';
import 'package:gallery_app_1/views/screens/picspage.dart';
import 'package:gallery_app_1/views/screens/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: (Provider.of<ThemeProvider>(context).light.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: "splash",
          routes: {
            '/': (context) => const HomePage(),
            'splash': (context) => const Splash(),
            'Pics': (context) => PicsPage(),
          },
        );
      },
    ),
  );
}
