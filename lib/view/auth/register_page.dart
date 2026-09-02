import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/base_page.dart';

/// Slicing register — no API
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameC = TextEditingController(), emailC = TextEditingController(), phoneC = TextEditingController(), passC = TextEditingController(), confirmC = TextEditingController();
  bool _obscure = true, _obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColor.ink), onPressed: ()=> Navigator.pop(context))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Text("Daftar Akun", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 24)),
            const SizedBox(height: 6),
            Text("Buat akun Gelora — slicing, tanpa backend.", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12), textAlign: TextAlign.center),
            const SizedBox(height: 22),
            TextFormField(controller: nameC, decoration: _dec("Nama Lengkap"), validator: (v)=> v==null||v.isEmpty? "Wajib diisi":null),
            const SizedBox(height: 12),
            TextFormField(controller: emailC, decoration: _dec("Email"), validator: (v)=> v==null||v.isEmpty? "Wajib diisi":null),
            const SizedBox(height: 12),
            TextFormField(controller: phoneC, decoration: _dec("No Telepon"), keyboardType: TextInputType.phone, validator: (v)=> v==null||v.isEmpty? "Wajib diisi":null),
            const SizedBox(height: 12),
            TextFormField(controller: passC, obscureText: _obscure, decoration: _dec("Kata Sandi").copyWith(suffixIcon: IconButton(icon: Icon(_obscure? Icons.visibility_off: Icons.visibility, size: 18), onPressed: ()=> setState(()=> _obscure=!_obscure))), validator: (v)=> v==null||v.isEmpty? "Wajib diisi":null),
            const SizedBox(height: 12),
            TextFormField(controller: confirmC, obscureText: _obscure2, decoration: _dec("Konfirmasi Kata Sandi").copyWith(suffixIcon: IconButton(icon: Icon(_obscure2? Icons.visibility_off: Icons.visibility, size: 18), onPressed: ()=> setState(()=> _obscure2=!_obscure2))), validator: (v)=> v!=passC.text? "Tidak sama":null),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, height: 46, child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const BasePage()), (_)=>false);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0),
              child: Text("Daftar Sekarang", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
            )),
            const SizedBox(height: 14),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Sudah punya akun? ", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12)),
              GestureDetector(onTap: ()=> Navigator.pop(context), child: Text("Masuk", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 12))),
            ]),
            const SizedBox(height: 24),
          ]),
        ),
      ),
    );
  }

  InputDecoration _dec(String hint)=> InputDecoration(
    hintText: hint, hintStyle: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 13),
    filled: true, fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.line)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.line)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColor.primary)),
  );
}
