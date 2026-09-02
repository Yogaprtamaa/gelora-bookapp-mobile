import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({super.key});
  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage> {
  String _selected = "Riwayat";
  final _tabs = ["Riwayat", "Dalam Proses", "Terjadwal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryDark,
      appBar: AppBar(backgroundColor: AppColor.primaryDark, foregroundColor: Colors.white, centerTitle: true, title: Text("Riwayat Transaksi", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)), elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: _tabs.map((t){
              final isSel = _selected==t;
              return GestureDetector(onTap: ()=> setState(()=> _selected=t), child: Column(children: [
                Text(t, style: fontTextStyle.copyWith(fontWeight: isSel? FontWeight.w800: FontWeight.w500, color: isSel? AppColor.primary: AppColor.inkFaint, fontSize: 13)),
                const SizedBox(height: 6),
                Container(height: 3, width: 36, decoration: BoxDecoration(color: isSel? AppColor.primary: Colors.transparent, borderRadius: BorderRadius.circular(10))),
              ]));
            }).toList()),
            const SizedBox(height: 18),
            if (_selected=="Riwayat") ...[
              _sectionHeader("Hari ini, 20 Des 2024"),
              const SizedBox(height: 12),
              ...MockData.history.map((h)=> _historyCard(h)),
              const SizedBox(height: 18),
              _sectionHeader("Kemarin", muted: true),
              const SizedBox(height: 12),
              _historyCard({"icon":"assets/r.png","title":"Tenis Indoor","subtitle":"Gelora Pondok Indah • 19 Des","amount":"Rp180.000","isExpense":false}),
            ] else
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColor.line)),
                child: Column(children: [
                  Icon(Icons.inbox_outlined, size: 36, color: AppColor.inkFaint),
                  const SizedBox(height: 10),
                  Text("Belum ada transaksi", style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, color: AppColor.inkLight)),
                  const SizedBox(height: 4),
                  Text("Tab \"$_selected\" masih kosong (slicing).", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
                ]),
              ),
          ]),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title, {bool muted=false}) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(title, style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, color: muted? AppColor.inkFaint: AppColor.ink, fontSize: 13)),
    const SizedBox(height: 8),
    Container(height: 1, color: AppColor.line),
  ]);

  Widget _historyCard(Map<String,dynamic> h) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: AppColor.surfaceMuted, borderRadius: BorderRadius.circular(14)),
    child: Row(children: [
      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)), child: Icon(h['isExpense']? Icons.sports_soccer: Icons.sports_basketball, size: 18, color: AppColor.primary)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(h['title'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 13)),
        Text(h['subtitle'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11)),
      ])),
      Text(h['amount'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 12, color: h['isExpense']? AppColor.danger: AppColor.primaryDark)),
    ]),
  );
}
