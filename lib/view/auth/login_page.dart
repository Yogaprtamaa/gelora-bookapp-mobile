import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/auth/register_page.dart';
import 'package:gelora/view/base_page.dart';

/// Slicing login — no API, langsung masuk.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "arga@gelora.id");
  final passwordController = TextEditingController(text: "gelora123");
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 24),
            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(20)), child: Text("GELORA • SPACE FOR SPORT", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 10, letterSpacing: 1))),
            const SizedBox(height: 18),
            Text("Masuk Akun", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 24, color: AppColor.ink)),
            const SizedBox(height: 8),
            Text("Slicing mode — ketuk masuk tanpa validasi server.", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12), textAlign: TextAlign.center),
            const SizedBox(height: 28),
            TextFormField(
              controller: emailController,
              decoration: _dec(hint: "Email"),
              validator: (v) => v==null||v.isEmpty ? "Email harus diisi":null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: passwordController,
              obscureText: passwordVisible,
              decoration: _dec(hint: "Kata Sandi").copyWith(
                suffixIcon: IconButton(icon: Icon(passwordVisible? Icons.visibility_off: Icons.visibility, color: AppColor.inkFaint), onPressed: ()=>setState(()=>passwordVisible=!passwordVisible)),
              ),
              validator: (v)=> v==null||v.isEmpty? "Kata sandi harus diisi":null,
            ),
            Align(alignment: Alignment.centerRight, child: TextButton(onPressed: (){}, child: Text("Lupa Password?", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w700, fontSize: 12)))),
            const SizedBox(height: 8),
            SizedBox(width: double.infinity, height: 46, child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const BasePage()), (_)=>false);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0),
              child: Text("Masuk Sekarang", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
            )),
            const SizedBox(height: 16),
            Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColor.accentSoft, borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.info_outline, size: 16, color: AppColor.accent), const SizedBox(width: 8), Expanded(child: Text("Mock login aktif — bebas masuk tanpa API.", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.accent, fontWeight: FontWeight.w600)))])),
            const SizedBox(height: 18),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Belum punya akun? ", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12)),
              GestureDetector(onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterPage())), child: Text("Daftar", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 12))),
            ]),
            const SizedBox(height: 24),
          ]),
        ),
      ),
    );
  }

  InputDecoration _dec({required String hint}) => InputDecoration(
    hintText: hint,
    hintStyle: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 13),
    filled: true, fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.line)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.line)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.primary, width: 1.2)),
  );
}
