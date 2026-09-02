import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gelora/config/app_color.dart';
import 'package:gelora/data/mock_data.dart';
import 'package:gelora/view/checkout/checkout_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, this.venueId});
  final dynamic venueId;
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _dateTime = DateTime.now();
  Map<String, dynamic>? _selected;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    final venue = MockData.venueById(widget.venueId) ?? MockData.venues.first;
    final schedule = MockData.scheduleForVenue(widget.venueId, "${_dateTime.year}-${_dateTime.month}-${_dateTime.day}");
    final slots = schedule['schedules'] as List;
    final availableCount = slots.where((s) => s['is_available'] == true).length;

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: AppColor.background,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 14, color: AppColor.ink),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Column(children: [
          Text("Booking Lapangan", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 15, color: AppColor.ink)),
          Text(venue['name'], style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11, fontWeight: FontWeight.w500)),
        ]),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(backgroundColor: AppColor.background, child: const Icon(Icons.help_outline, size: 18, color: AppColor.inkLight)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Venue hero card
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColor.line),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 6))],
            ),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  venue['image'],
                  width: 72, height: 72, fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(width: 72, height: 72, color: AppColor.surfaceMuted, child: const Icon(Icons.image, color: AppColor.inkFaint)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(20)),
                      child: Text(venue['category']['name'], style: fontTextStyle.copyWith(color: AppColor.primary, fontSize: 10, fontWeight: FontWeight.w800)),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(color: AppColor.success.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColor.success, shape: BoxShape.circle)),
                        const SizedBox(width: 4),
                        Text("Buka", style: fontTextStyle.copyWith(color: AppColor.success, fontSize: 10, fontWeight: FontWeight.w800)),
                      ]),
                    ),
                  ]),
                  const SizedBox(height: 6),
                  Text(venue['name'], style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 13, color: AppColor.ink), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
                  Row(children: [
                    const Icon(Icons.location_on, size: 12, color: AppColor.inkFaint),
                    const SizedBox(width: 3),
                    Expanded(child: Text(venue['address'], style: fontTextStyle.copyWith(color: AppColor.inkLight, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis)),
                  ]),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.star, size: 12, color: AppColor.accent),
                    const SizedBox(width: 3),
                    Text("4.8 • 1.2k ulasan", style: fontTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: AppColor.inkLight)),
                    const Spacer(),
                    Text("Rp ${venue['price']}", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, color: AppColor.primary, fontSize: 12)),
                    Text(" /jam", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 10)),
                  ]),
                ]),
              ),
            ]),
          ),

          // Date section
          Container(
            margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColor.line)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.calendar_today_rounded, size: 14, color: AppColor.primary)),
                const SizedBox(width: 10),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Pilih Tanggal Main", style: fontTextStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 13)),
                  Text("Geser untuk lihat 7 hari ke depan", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11)),
                ]),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
                  child: Text("${_dateTime.day} ${_monthName(_dateTime.month)}", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 11)),
                ),
              ]),
              const SizedBox(height: 12),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (d) => setState(() {_dateTime = d; _selected = null; totalPrice = 0;}),
                activeColor: AppColor.primary,
                dayProps: const EasyDayProps(todayHighlightStyle: TodayHighlightStyle.withBackground, todayHighlightColor: Color(0xFFEDE9FF)),
              ),
            ]),
          ),

          // Sessions header + legend
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Row(children: [
              Text("Pilih Sesi", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 14)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColor.primaryLight, borderRadius: BorderRadius.circular(20)),
                child: Text("$availableCount tersedia", style: fontTextStyle.copyWith(color: AppColor.primary, fontWeight: FontWeight.w800, fontSize: 11)),
              ),
              const Spacer(),
              _legendDot(AppColor.success, "Tersedia"),
              const SizedBox(width: 10),
              _legendDot(AppColor.inkFaint, "Penuh"),
              const SizedBox(width: 10),
              _legendDot(AppColor.primary, "Dipilih"),
            ]),
          ),

          // Grid slots — improved cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.75, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: slots.length,
              itemBuilder: (c, i) {
                final s = slots[i] as Map<String, dynamic>;
                final available = s['is_available'] == true;
                final selected = _selected == s;
                return _slotCard(
                  start: (s['start_time'] as String).substring(0, 5),
                  end: (s['end_time'] as String).substring(0, 5),
                  price: "Rp ${venue['price']}",
                  available: available,
                  selected: selected,
                  onTap: available ? () => setState(() {
                    if (selected) {_selected = null; totalPrice = 0;} else {_selected = s; totalPrice = double.tryParse(venue['price'].toString()) ?? 0;}
                  }) : null,
                );
              },
            ),
          ),

          // Info box
          Container(
            margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFFFFBEB), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFFDE68A))),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.info_outline, size: 14, color: Color(0xFFD97706))),
              const SizedBox(width: 10),
              Expanded(child: Text("Sesi 60 menit • Check-in 10 menit sebelum jam mulai • Pembatalan gratis H-1", style: fontTextStyle.copyWith(fontSize: 11, color: const Color(0xFF92400E), height: 1.4))),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: AppColor.line)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -6))]),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: SafeArea(
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: _selected != null ? AppColor.success : AppColor.inkFaint, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  Text(_selected != null ? "1 sesi terpilih" : "Belum pilih sesi", style: fontTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w700, color: _selected != null ? AppColor.success : AppColor.inkFaint)),
                  if (_selected != null) ...[
                    const SizedBox(width: 6),
                    Text("• ${(_selected!['start_time'] as String).substring(0,5)} - ${(_selected!['end_time'] as String).substring(0,5)}", style: fontTextStyle.copyWith(fontSize: 11, color: AppColor.inkLight)),
                  ]
                ]),
                const SizedBox(height: 4),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(_selected != null ? "Rp ${totalPrice.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}" : "Rp 0", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 18, color: AppColor.ink)),
                  const SizedBox(width: 6),
                  Padding(padding: const EdgeInsets.only(bottom: 2), child: Text("/ 60 menit", style: fontTextStyle.copyWith(color: AppColor.inkFaint, fontSize: 11))),
                ]),
              ]),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _selected == null ? null : () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutPage(
                    venueId: venue['id'],
                    bookingDate: "${_dateTime.year}-${_dateTime.month.toString().padLeft(2,'0')}-${_dateTime.day.toString().padLeft(2,'0')}",
                    startTime: (_selected!['start_time'] as String).substring(0,5),
                    endTime: (_selected!['end_time'] as String).substring(0,5),
                    totalPayment: totalPrice,
                    categoryId: venue['category_id'],
                  )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  disabledBackgroundColor: AppColor.surfaceMuted,
                  disabledForegroundColor: AppColor.inkFaint,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text("Lanjut Bayar", style: fontTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.white),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _slotCard({required String start, required String end, required String price, required bool available, required bool selected, VoidCallback? onTap}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? AppColor.primary : (available ? Colors.white : const Color(0xFFF8FAFC)),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: selected ? AppColor.primary : (available ? AppColor.line : const Color(0xFFE2E8F0)), width: selected ? 1.6 : 1),
        boxShadow: selected ? [BoxShadow(color: AppColor.primary.withOpacity(0.22), blurRadius: 14, offset: const Offset(0, 6))] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: selected ? Colors.white.withOpacity(0.18) : (available ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(selected ? Icons.check_circle : (available ? Icons.verified : Icons.block), size: 10, color: selected ? Colors.white : (available ? const Color(0xFF16A34A) : AppColor.inkFaint)),
                  const SizedBox(width: 4),
                  Text(available ? (selected ? "Dipilih" : "Tersedia") : "Penuh", style: fontTextStyle.copyWith(fontSize: 9, fontWeight: FontWeight.w800, color: selected ? Colors.white : (available ? const Color(0xFF15803D) : AppColor.inkFaint))),
                ]),
              ),
              const Spacer(),
              Text("60'", style: fontTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: selected ? Colors.white70 : AppColor.inkFaint)),
            ]),
            const Spacer(),
            Text("$start – $end", style: fontTextStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 15, color: selected ? Colors.white : AppColor.ink, letterSpacing: 0.2)),
            const SizedBox(height: 4),
            Row(children: [
              Icon(Icons.payments_outlined, size: 12, color: selected ? Colors.white70 : AppColor.inkFaint),
              const SizedBox(width: 4),
              Text(price, style: fontTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w800, color: selected ? Colors.white : AppColor.primary)),
              const Spacer(),
              Container(
                width: 26, height: 26,
                decoration: BoxDecoration(color: selected ? Colors.white : (available ? AppColor.primary : AppColor.surfaceMuted), shape: BoxShape.circle),
                child: Icon(selected ? Icons.check : (available ? Icons.add : Icons.close), size: 14, color: selected ? AppColor.primary : (available ? Colors.white : AppColor.inkFaint)),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _legendDot(Color c, String label) => Row(mainAxisSize: MainAxisSize.min, children: [
    Container(width: 8, height: 8, decoration: BoxDecoration(color: c, shape: BoxShape.circle)),
    const SizedBox(width: 4),
    Text(label, style: fontTextStyle.copyWith(fontSize: 10, color: AppColor.inkFaint, fontWeight: FontWeight.w600)),
  ]);

  String _monthName(int m) => const ["", "Jan","Feb","Mar","Apr","Mei","Jun","Jul","Agu","Sep","Okt","Nov","Des"][m];
}
