import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';
import 'package:gelora/view/venue/venue_detail_page.dart';

/// GELORA — Home slicing, no fetching.
/// Pure mock data rendering.
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  // Mock user slicing
  final _user = MockData.user;
  int selectedCategory = 1;

  List<Map<String, dynamic>> get _filteredVenues {
    if (selectedCategory == 0) return MockData.venues;
    return MockData.venuesByCategory(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final categories = MockData.categories;
    final banners = MockData.banners;

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Gelora
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20, left: 26, right: 26, bottom: 22),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: AppColor.accent, borderRadius: BorderRadius.circular(20)),
                        child: Text("GELORA", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1.2)),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.notifications_none, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text("Halo, ${_user['name']} 👋", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text("Jelajahi olahraga seru di sekitarmu", style: fontTextStyle.copyWith(color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w500, fontSize: 13)),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: AppColor.inkLight, size: 20),
                        const SizedBox(width: 10),
                        Text("Cari lapangan, basket, badminton...", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            CarouselSlider(
              items: banners.map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(e['image_url'], fit: BoxFit.cover, errorBuilder: (c,e,s)=> Container(color: AppColor.primaryLight, child: const Icon(Icons.image, color: AppColor.inkFaint))),
                    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black.withOpacity(0.45), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter))),
                    Positioned(
                      left: 14, bottom: 14, right: 14,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColor.accent, borderRadius: BorderRadius.circular(8)), child: Text("PROMO", style: fontTextStyle.copyWith(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800))),
                        const SizedBox(height: 6),
                        Text(e['title'], style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                      ]),
                    ),
                  ],
                ),
              )).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.88,
                enableInfiniteScroll: false,
                onPageChanged: (i, _) => setState(() => _current = i),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(banners.length, (i) => Container(
                width: _current == i ? 18 : 6, height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(color: _current == i ? AppColor.primary : AppColor.line, borderRadius: BorderRadius.circular(10)),
              )),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text("Kategori", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColor.ink)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 36,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 14, right: 26),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (c, i) {
                  final cat = categories[i];
                  final isSelected = selectedCategory == cat['id'];
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategory = cat['id']),
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColor.primary : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: isSelected ? AppColor.primary : AppColor.line),
                        boxShadow: isSelected ? [BoxShadow(color: AppColor.primary.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 4))] : null,
                      ),
                      child: Text(cat['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12, color: isSelected ? Colors.white : AppColor.inkLight)),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Row(children: [
                Text("Lapangan Populer", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
                const Spacer(),
                Text("${_filteredVenues.length} venue", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 12)),
              ]),
            ),
            const SizedBox(height: 14),
            ..._filteredVenues.map((v) => Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 14),
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VenueDetailPage(venueId: v['id']))),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: const Color(0xFF94A8BE).withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 6))]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                      child: Stack(children: [
                        Image.network(v['image'], height: 160, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c,e,s)=> Container(height:160, color: AppColor.surfaceMuted, child: const Icon(Icons.sports_soccer, color: AppColor.inkFaint))),
                        Positioned(top: 10, left: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star, size: 12, color: AppColor.accent), const SizedBox(width: 4), Text("4.8", style: fontTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w700))]))),
                        Positioned(top: 10, right: 10, child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)), child: Text(v['category']['name'], style: fontTextStyle.copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)))),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(v['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 14, color: AppColor.ink)),
                        const SizedBox(height: 4),
                        Row(children: [const Icon(Icons.location_on, size: 13, color: AppColor.inkFaint), const SizedBox(width: 4), Expanded(child: Text(v['address'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis))]),
                        const SizedBox(height: 10),
                        Row(children: [
                          Text("Rp ${v['price']}", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, color: AppColor.primary, fontSize: 14)),
                          Text(" / jam", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
                          const Spacer(),
                          Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)), child: Text("Booking", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
                        ]),
                      ]),
                    ),
                  ]),
                ),
              ),
            )),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
