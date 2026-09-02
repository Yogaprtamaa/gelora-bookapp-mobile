import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';
import 'package:gelora/view/base_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.user;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, centerTitle: true, title: Text("Profil Saya", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 16))),
      body: Column(children: [
        Stack(children: [
          Container(height: 120, width: double.infinity, decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppColor.primary, AppColor.primaryDark]), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)))),
          Positioned(left: 20, right: 20, bottom: 0, child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, 8))]),
            child: Row(children: [
              Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(14)), child: const Icon(Icons.person, color: AppColor.primary, size: 28)),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(user['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 14)),
                const SizedBox(height: 2),
                Text(user['email'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11)),
                Text(user['phone'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11)),
              ])),
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)), child: Text("Member", style: fontTextStyle.copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700))),
            ]),
          )),
        ]),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColor.line)),
            child: Column(children: [
              _tile(icon: Icons.edit_outlined, title: "Ubah Profil", subtitle: "Nama & no. telepon"),
              const Divider(height: 1, color: AppColor.line),
              _tile(icon: Icons.lock_outline, title: "Ganti Password", subtitle: "Slicing — simulasi"),
              const Divider(height: 1, color: AppColor.line),
              _tile(icon: Icons.help_outline, title: "Bantuan", subtitle: "FAQ & kontak Gelora"),
            ]),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(width: double.infinity, height: 44, child: OutlinedButton(
            onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> const BasePage()), (_)=>false);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Keluar — slicing mode", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.ink));
            },
            style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColor.danger), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            child: Text("Keluar", style: fontTextStyle.copyWith(color: AppColor.danger, fontWeight: FontWeight.w800)),
          )),
        ),
        const SizedBox(height: 10),
        Text("Gelora v2.0 • Slicing Mode", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 10)),
      ]),
    );
  }

  Widget _tile({required IconData icon, required String title, required String subtitle}) => ListTile(
    leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 18, color: AppColor.primary)),
    title: Text(title, style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
    subtitle: Text(subtitle, style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
    trailing: const Icon(Icons.chevron_right, size: 18, color: AppColor.inkFaint),
    dense: true,
  );
}
