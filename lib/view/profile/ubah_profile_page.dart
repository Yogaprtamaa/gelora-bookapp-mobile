import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';

class UbahProfilePage extends StatefulWidget {
  const UbahProfilePage({super.key});
  @override
  State<UbahProfilePage> createState() => _UbahProfilePageState();
}

class _UbahProfilePageState extends State<UbahProfilePage> {
  final nameC = TextEditingController(text: MockData.user['name']);
  final phoneC = TextEditingController(text: MockData.user['phone']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColor.ink), onPressed: ()=> Navigator.pop(context)), title: Text("Ubah Profil", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColor.primary.withOpacity(0.15))),
            child: Row(children: [const Icon(Icons.info_outline, size: 16, color: AppColor.primary), const SizedBox(width: 8), Expanded(child: Text("Slicing mode — perubahan hanya di UI, tidak ke server.", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.primary, fontWeight: FontWeight.w600)))]),
          ),
          const SizedBox(height: 18),
          TextFormField(controller: nameC, decoration: _dec("Nama Lengkap")),
          const SizedBox(height: 14),
          TextFormField(controller: phoneC, decoration: _dec("No Telepon"), keyboardType: TextInputType.phone),
          const SizedBox(height: 22),
          SizedBox(width: double.infinity, height: 44, child: ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profil diperbarui (mock)", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.success));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), elevation: 0),
            child: Text("Simpan", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)),
          )),
        ]),
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
