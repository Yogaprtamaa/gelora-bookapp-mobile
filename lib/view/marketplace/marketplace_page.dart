import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';
import 'package:gelora/view/marketplace/product_detail/product_detail_page.dart';

/// GELORA Market — slicing with mock products
class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});
  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final CarouselSliderController _c = CarouselSliderController();
  int _current = 0;
  String selected = "All";
  List<String> tabs = ["All", "Futsal", "Basket", "Badminton", "Apparel"];

  @override
  Widget build(BuildContext context) {
    final products = selected == "All" ? MockData.products : MockData.products.where((p) => p['category']==selected).toList();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)), child: Text("GELORA MARKET", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: 1))),
              const Spacer(),
              _iconBtn(Icons.favorite_border),
              const SizedBox(width: 8),
              _iconBtn(Icons.shopping_bag_outlined),
            ]),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColor.line)),
              child: Row(children: [const Icon(Icons.search, color: AppColor.inkFaint, size: 20), const SizedBox(width: 10), Text("Cari bola, raket, jersey...", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 12)), const Spacer(), Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.tune, size: 16, color: AppColor.primary))]),
            ),
          ),
          const SizedBox(height: 16),
          CarouselSlider(
            items: MockData.banners.map((b)=> ClipRRect(borderRadius: BorderRadius.circular(14), child: Stack(fit: StackFit.expand, children: [
              Image.network(b['image_url'], fit: BoxFit.cover),
              Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColor.primary.withOpacity(0.75), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
              Positioned(left: 14, bottom: 14, child: Text(b['title'], style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13))),
            ]))).toList(),
            carouselController: _c,
            options: CarouselOptions(height: 130, viewportFraction: 0.88, enableInfiniteScroll: false, onPageChanged: (i,_)=> setState(()=> _current=i)),
          ),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(MockData.banners.length, (i)=> Container(width: _current==i? 18:6, height: 6, margin: const EdgeInsets.symmetric(horizontal: 3), decoration: BoxDecoration(color: _current==i? AppColor.primary: AppColor.line, borderRadius: BorderRadius.circular(10))))),
          const SizedBox(height: 16),
          SizedBox(height: 34, child: ListView.builder(
            padding: const EdgeInsets.only(left: 12, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (c,i){
              final isSel = selected==tabs[i];
              return GestureDetector(onTap: ()=> setState(()=> selected=tabs[i]), child: Container(margin: const EdgeInsets.only(left: 8), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: isSel? AppColor.primary: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: isSel? AppColor.primary: AppColor.line)), child: Text(tabs[i], style: fontTextStyle.copyWith(color: isSel? Colors.white: AppColor.inkLight, fontWeight: FontWeight.w700, fontSize: 12))));
            },
          )),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [Text("New Arrivals", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15)), const Spacer(), Text("Lihat Semua", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w700, fontSize: 12))]),
          ),
          const SizedBox(height: 12),
          SizedBox(height: 220, child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: MockData.products.length,
            separatorBuilder: (_,__)=> const SizedBox(width: 12),
            itemBuilder: (c,i){
              final p = MockData.products[i];
              return Container(
                width: 160,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0,4))]),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.network(p['networkImage'], height: 90, width: double.infinity, fit: BoxFit.cover)),
                  const SizedBox(height: 8),
                  Text(p['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                  Text(p['category'], style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
                  const Spacer(),
                  Row(children: [
                    Text("Rp ${(p['price'] as int).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m)=> '${m[1]}.')}", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 12, color: AppColor.primary)),
                    const Spacer(),
                    Container(padding: const EdgeInsets.all(5), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.add, size: 14, color: Colors.white)),
                  ]),
                ]),
              );
            },
          )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const ProductDetailPage())),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0,6))]),
                child: Row(children: [
                  ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(MockData.products.first['networkImage'], width: 90, height: 90, fit: BoxFit.cover)),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColor.accentSoft, borderRadius: BorderRadius.circular(20)), child: Text("REKOMENDASI", style: fontTextStyle.copyWith(color: AppColor.accent, fontSize: 9, fontWeight: FontWeight.w800))),
                    const SizedBox(height: 6),
                    Text("Molten Basket GG7X", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text("Edisi premium — grip maksimal & daya tahan tinggi.", style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                    Row(children: [
                      Text("Rp 990.000", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, color: AppColor.primary, fontSize: 13)),
                      const Spacer(),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)), child: Text("Sewa", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
                    ]),
                  ])),
                ]),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }

  Widget _iconBtn(IconData icon)=> Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColor.line)), child: Icon(icon, size: 18, color: AppColor.ink));
}
