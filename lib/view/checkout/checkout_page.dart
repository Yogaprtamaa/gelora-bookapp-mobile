import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, this.venueId, this.categoryId, this.bookingDate, this.startTime, this.endTime, this.totalPayment});
  final dynamic venueId, categoryId, bookingDate, startTime, endTime, totalPayment;

  @override
  Widget build(BuildContext context) {
    final venue = MockData.venueById(venueId) ?? MockData.venues.first;
    final total = totalPayment?.toString() ?? venue['price'].toString();
    return Scaffold(
      backgroundColor: AppColor.primaryDark,
      appBar: AppBar(backgroundColor: AppColor.primaryDark, foregroundColor: Colors.white, title: Text("Checkout", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)), centerTitle: true, leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white), onPressed: ()=>Navigator.pop(context))),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 12),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(borderRadius: BorderRadius.circular(14), child: Image.network(venue['image'], width: double.infinity, height: 160, fit: BoxFit.cover)),
            const SizedBox(height: 14),
            Text(venue['name'], style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 6),
            Row(children: [const Icon(Icons.location_on, size: 14, color: AppColor.inkFaint), const SizedBox(width: 4), Expanded(child: Text(venue['address'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12)))]),
            const SizedBox(height: 20),
            Text("Jadwal Booking", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 15)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColor.line)),
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(venue['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
                  const Icon(Icons.delete_outline, size: 18, color: AppColor.inkFaint),
                ]),
                const SizedBox(height: 6),
                Align(alignment: Alignment.centerLeft, child: Text(bookingDate?.toString() ?? "2024-12-20", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12))),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(color: AppColor.primary.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Text("$startTime - $endTime", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 13)),
                    const Spacer(),
                    Text("Rp $total", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, color: AppColor.primary)),
                  ]),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Text("Rincian Pembayaran", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 12),
            _row("Biaya Sewa", "Rp $total"),
            const SizedBox(height: 8),
            _row("Biaya Admin", "Rp 0", isLink: true),
            const SizedBox(height: 8),
            _row("PPN (11%)", "Rp ${(int.tryParse(total.toString()) != null ? (int.parse(total.toString())*0.11).toInt() : 0)}"),
            const Divider(height: 24, color: AppColor.line),
            _row("Total Bayar", "Rp $total", isBold: true),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColor.success.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColor.success.withOpacity(0.2))),
              child: Row(children: [
                const Icon(Icons.verified, color: AppColor.success, size: 16),
                const SizedBox(width: 8),
                Expanded(child: Text("Booking slicing (mock) — pembayaran simulasi berhasil.", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.success, fontWeight: FontWeight.w600))),
              ]),
            ),
            const SizedBox(height: 80),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SafeArea(child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Total Bayar", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.inkFaint)), Text("Rp $total", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 15))]),
          const Spacer(),
          SizedBox(height: 44, child: ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Berhasil dibayar — Gelora", style: fontTextStyle.copyWith(color: Colors.white)), backgroundColor: AppColor.success));
            Navigator.popUntil(context, (r)=> r.isFirst);
          }, style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 22)), child: Text("Bayar Sekarang", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800)))),
        ])),
      ),
    );
  }
  Widget _row(String title, String value, {bool isBold=false, bool isLink=false}) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    isLink ? Text(title, style: fontTextStyle.copyWith(color: AppColor.primary, decoration: TextDecoration.underline, fontSize: 13)) : Text(title, style: fontTextStyle.copyWith(fontWeight: isBold? FontWeight.w800: FontWeight.w500, fontSize: 13)),
    Text(value, style: fontTextStyle.copyWith(fontWeight: isBold? FontWeight.w900: FontWeight.w600, fontSize: 13, color: AppColor.ink)),
  ]);
}
