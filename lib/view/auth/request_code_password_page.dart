import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/auth/reset_password.dart';

class RequestCodePasswordPage extends StatefulWidget {
  const RequestCodePasswordPage({super.key});
  @override
  State<RequestCodePasswordPage> createState() => _RequestCodePasswordPageState();
}

class _RequestCodePasswordPageState extends State<RequestCodePasswordPage> {
  final emailC = TextEditingController();
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
            Text("Request Kode Reset", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 22)),
            const SizedBox(height: 8),
            Text("Masukkan email untuk simulasi kode reset (slicing).", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12), textAlign: TextAlign.center),
            const SizedBox(height: 24),
            TextFormField(controller: emailC, decoration: _dec("Email"), validator: (v)=> v==null||v.isEmpty? "Wajib diisi":null),
            const SizedBox(height: 18),
            SizedBox(width: double.infinity, height: 44, child: ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kode dikirim ke ${emailC.text} (mock)", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.success));
                  Navigator.push(context, MaterialPageRoute(builder: (_)=> ResetPassword(email: emailC.text)));
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0),
              child: Text("Kirim Kode", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
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
