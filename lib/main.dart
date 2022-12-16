import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/map_page.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        title: 'QR Reader',
        debugShowCheckedModeBanner: false,
        initialRoute: "home",
        routes: {"home": (_) => const HomePage(), "mapa": (_) => const MapPage()},
        theme: AppTheme.shared.themeData,
      ),
    );
  }
}
