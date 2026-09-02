import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/base_page.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key, this.email});
  final dynamic email;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final codeC = TextEditingController();
  final passC = TextEditingController();
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 16), onPressed: ()=> Navigator.pop(context))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Text("Reset Password", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 22)),
            const SizedBox(height: 8),
            Text("Masukkan kode (bebas) & password baru — slicing mock.", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12), textAlign: TextAlign.center),
            const SizedBox(height: 22),
            TextFormField(controller: codeC, decoration: _dec("Kode (contoh: 123456)"), validator: (v)=> v==null||v.isEmpty? "Wajib":null),
            const SizedBox(height: 12),
            TextFormField(controller: passC, obscureText: obscure, decoration: _dec("Password Baru").copyWith(suffixIcon: IconButton(icon: Icon(obscure? Icons.visibility_off: Icons.visibility, size: 18), onPressed: ()=> setState(()=> obscure=!obscure))), validator: (v)=> v==null||v.isEmpty? "Wajib":null),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, height: 44, child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password direset (mock)", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.success));
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const BasePage()), (_)=>false);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0),
              child: Text("Reset Password", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
            )),
            const SizedBox(height: 10),
            SizedBox(width: double.infinity, height: 44, child: OutlinedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kode baru dikirim (mock)", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.primary));
              },
              style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColor.primary), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
              child: Text("Kirim Ulang Kode", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w700)),
            )),
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
  );
}
