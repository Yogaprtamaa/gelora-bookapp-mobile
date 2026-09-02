import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'base_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BasePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColor.primary, AppColor.primaryDark], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 8))]),
              child: const Icon(Icons.sports_soccer, size: 42, color: AppColor.primary),
            ),
            const SizedBox(height: 18),
            Text("GELORA", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 28, letterSpacing: 4)),
            const SizedBox(height: 6),
            Text("SPACE FOR SPORT", style: fontTextStyle.copyWith(color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w600, fontSize: 11, letterSpacing: 2)),
            const SizedBox(height: 30),
            SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white.withOpacity(0.9), strokeWidth: 2.5)),
          ]),
        ),
      ),
    );
  }
}
