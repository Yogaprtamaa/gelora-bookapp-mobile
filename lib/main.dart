import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // No dotenv needed — pure slicing with mock data
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gelora',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'PlusJakartaSans'),
      ),
      home: const SplashScreen(),
    );
  }
}
