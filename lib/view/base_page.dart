import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/view/history_transaction/history_transaction_page.dart';
import 'package:gelora/view/home/home_page.dart';
import 'package:gelora/view/marketplace/marketplace_page.dart';
import 'package:gelora/view/profile/profile_page.dart';

/// Slicing — no auth check. Always show main navigation.
/// Gelora bottom nav with new palette.
class BasePage extends StatefulWidget {
  const BasePage({super.key});
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [HomePage(), HistoryTransactionPage(), MarketplacePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4))]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(children: List.generate(4, (i) {
              final isActive = _selectedIndex == i;
              final icons = [Icons.home_rounded, Icons.receipt_long_rounded, Icons.storefront_rounded, Icons.person_rounded];
              final labels = ["Beranda", "Riwayat", "Market", "Profil"];
              return Expanded(child: GestureDetector(
                onTap: ()=> setState(()=> _selectedIndex=i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(color: isActive? AppColor.primary : Colors.transparent, borderRadius: BorderRadius.circular(14)),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(icons[i], size: 20, color: isActive? Colors.white : AppColor.inkFaint),
                    const SizedBox(height: 2),
                    Text(labels[i], style: fontTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: isActive? Colors.white : AppColor.inkFaint)),
                  ]),
                ),
              ));
            })),
          ),
        ),
      ),
    );
  }
}
