import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final p = MockData.products.first;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: Text("Detail Produk", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 16)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 14, color: AppColor.ink), onPressed: ()=> Navigator.pop(context))),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Center(child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(p['networkImage'], width: 200, height: 200, fit: BoxFit.cover))),
          ),
          const SizedBox(height: 16),
          Text(p['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 20, color: AppColor.ink)),
          const SizedBox(height: 6),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(20)), child: Text(p['category'], style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w700, fontSize: 11))),
          const SizedBox(height: 14),
          Text("Deskripsi", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(height: 6),
          Text(p['desc'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 13, height: 1.5)),
          const SizedBox(height: 16),
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColor.accentSoft, borderRadius: BorderRadius.circular(12)), child: Row(children: [const Icon(Icons.verified, size: 16, color: AppColor.accent), const SizedBox(width: 8), Expanded(child: Text("Produk slicing — stok selalu tersedia.", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.accent, fontWeight: FontWeight.w600)))])),
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SafeArea(child: Row(children: [
          Text("Rp ${(p['price'] as int).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m)=> '${m[1]}.')}", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 16, color: AppColor.ink)),
          const Spacer(),
          SizedBox(height: 44, child: ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ditambahkan ke keranjang (mock)", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.success));
          }, style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 22)), child: Text("Checkout", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))),
        ])),
      ),
    );
  }
}
