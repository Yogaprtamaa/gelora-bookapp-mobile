import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';
import 'package:gelora/view/booking/booking_page.dart';

class VenueDetailPage extends StatelessWidget {
  const VenueDetailPage({super.key, this.venueId});
  final dynamic venueId;

  @override
  Widget build(BuildContext context) {
    final venue = MockData.venueById(venueId) ?? MockData.venues.first;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColor.primaryDark,
            leading: Padding(padding: const EdgeInsets.all(8), child: CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColor.ink), onPressed: () => Navigator.pop(context)))),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(fit: StackFit.expand, children: [
                Image.network(venue['image'], fit: BoxFit.cover),
                Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withOpacity(0.55)], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
                Positioned(left: 20, bottom: 18, right: 20, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: AppColor.accent, borderRadius: BorderRadius.circular(20)), child: Text(venue['category']['name'], style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 11))),
                  const SizedBox(height: 8),
                  Text(venue['name'], style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20)),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on, color: Colors.white70, size: 13), const SizedBox(width: 4), Expanded(child: Text(venue['address'], style: fontTextStyle.copyWith(color: Colors.white.withOpacity(0.9), fontSize: 12)))]),
                ])),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    _pill(Icons.star, "4.8 (1.2k)", AppColor.accent),
                    const SizedBox(width: 8),
                    _pill(Icons.verified, "Gelora Choice", AppColor.primary),
                    const Spacer(),
                    Icon(Icons.share_outlined, color: AppColor.inkLight, size: 20),
                    const SizedBox(width: 12),
                    Icon(Icons.favorite_border, color: AppColor.inkLight, size: 20),
                  ]),
                  const SizedBox(height: 20),
                  Text("Tentang Venue", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: AppColor.ink)),
                  const SizedBox(height: 8),
                  Text(venue['description'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 12, height: 1.6)),
                  const SizedBox(height: 20),
                  Text("Jam Operasional", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColor.line)),
                    child: Column(children: [
                      _hourRow("Senin – Jumat", "08.00 – 23.00"),
                      const Divider(height: 16, color: AppColor.line),
                      _hourRow("Sabtu", "07.00 – 00.00"),
                      const Divider(height: 16, color: AppColor.line),
                      _hourRow("Minggu", "07.00 – 00.00"),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Text("Fasilitas", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
                  const SizedBox(height: 10),
                  Wrap(spacing: 8, runSpacing: 8, children: [
                    _facility("Parkir Luas"),
                    _facility("Kantin"),
                    _facility("Musholla"),
                    _facility("Toilet Bersih"),
                    _facility("Sewa Alat"),
                    _facility("Tribun"),
                  ]),
                  const SizedBox(height: 20),
                  Text("Lokasi", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 15)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColor.background, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColor.line)),
                    child: Row(children: [
                      Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.map, color: Colors.white, size: 16)),
                      const SizedBox(width: 10),
                      Expanded(child: Text(venue['address'], style: fontTextStyle.copyWith(fontSize: 12, color: AppColor.inkLight))),
                      Text("Lihat Maps", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w700, fontSize: 12)),
                    ]),
                  ),
                  const SizedBox(height: 90),
                ]),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4))]),
        child: SafeArea(
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Mulai dari", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
              const SizedBox(height: 2),
              Text("Rp ${venue['price']} / jam", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 15, color: AppColor.ink)),
            ]),
            const Spacer(),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookingPage(venueId: venue['id']))),
                style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), elevation: 0, padding: const EdgeInsets.symmetric(horizontal: 22)),
                child: Text("Book Sekarang", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _pill(IconData icon, String label, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withOpacity(0.25))),
    child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 12, color: color), const SizedBox(width: 4), Text(label, style: fontTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: color))]),
  );

  Widget _hourRow(String day, String hour) => Row(children: [Text(day, style: fontTextStyle.copyWith(fontSize: 12, color: AppColor.inkLight)), const Spacer(), Text(hour, style: fontTextStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 12))]);

  Widget _facility(String name) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColor.primary.withOpacity(0.15))),
    child: Text(name, style: fontTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: AppColor.primary)),
  );
}
