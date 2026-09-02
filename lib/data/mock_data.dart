// ignore_for_file: prefer_const_constructors
/// GELORA Mock Data — pure slicing, no fetching.
/// All images use picsum / unplash / assets fallback so UI always renders.

class MockData {
  // ---------- USER ----------
  static Map<String, dynamic> user = {
    "id": 1,
    "name": "Arga Pratama",
    "email": "arga@gelora.id",
    "phone": "0812 3456 7890",
    "roles": "user",
    "created_at": "2024-01-10T08:00:00Z",
    "updated_at": "2024-01-10T08:00:00Z",
  };

  // ---------- CATEGORIES ----------
  static List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "Futsal", "created_at": null, "updated_at": null},
    {"id": 2, "name": "Mini Soccer", "created_at": null, "updated_at": null},
    {"id": 3, "name": "Badminton", "created_at": null, "updated_at": null},
    {"id": 4, "name": "Basket", "created_at": null, "updated_at": null},
    {"id": 5, "name": "Tenis", "created_at": null, "updated_at": null},
    {"id": 6, "name": "Voli", "created_at": null, "updated_at": null},
  ];

  // ---------- BANNERS ----------
  static List<Map<String, dynamic>> banners = [
    {
      "id": 1,
      "title": "Weekend Push — Diskon 25%",
      "image_url": "https://picsum.photos/seed/gelora1/800/400",
      "link_url": null,
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 2,
      "title": "Sewa Alat Gratis Ongkir",
      "image_url": "https://picsum.photos/seed/gelora2/800/400",
      "link_url": null,
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 3,
      "title": "Turnamen Mini Soccer Juni",
      "image_url": "https://picsum.photos/seed/gelora3/800/400",
      "link_url": null,
      "created_at": null,
      "updated_at": null,
    },
  ];

  // ---------- VENUES ----------
  static List<Map<String, dynamic>> venues = [
    {
      "id": 1,
      "owner_id": 1,
      "category_id": 1,
      "name": "Gelora Futsal Senayan",
      "description": "Lapangan futsal sintetis terbaru dengan standar FIFA. Lampu terang, ruang ganti bersih, dan kantin 24 jam. Cocok untuk sparing & turnamen.",
      "image": "https://picsum.photos/seed/venue1/600/400",
      "address": "Jl. Gerbang Pemuda No.3, Senayan, Jakarta",
      "price": "150000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 1, "name": "Futsal"},
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 2,
      "owner_id": 1,
      "category_id": 3,
      "name": "Gelora Badminton Hall",
      "description": "8 court karpet vinyl, shuttlecock gratis untuk member. AC dingin, tribun penonton nyaman.",
      "image": "https://picsum.photos/seed/venue2/600/400",
      "address": "Jl. Pahlawan No.88, Kuningan, Jakarta",
      "price": "80000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 3, "name": "Badminton"},
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 3,
      "owner_id": 1,
      "category_id": 2,
      "name": "Mini Soccer Park Bintaro",
      "description": "Rumput sintetis Eropa, luas 40x60m. Perfect buat fun match kantor & komunitas.",
      "image": "https://picsum.photos/seed/venue3/600/400",
      "address": "Bintaro Sektor 9, Tangerang Selatan",
      "price": "600000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 2, "name": "Mini Soccer"},
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 4,
      "owner_id": 1,
      "category_id": 4,
      "name": "Arena Basket Gelora",
      "description": "Lapangan kayu maple NBA spec, ring hydraulic, skorboard digital.",
      "image": "https://picsum.photos/seed/venue4/600/400",
      "address": "Jl. Hang Jebat No.12, Kebayoran, Jakarta",
      "price": "250000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 4, "name": "Basket"},
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 5,
      "owner_id": 1,
      "category_id": 5,
      "name": "Tenis Gelora Indoor",
      "description": "Hard court plexipave, bola & raket bisa sewa di tempat.",
      "image": "https://picsum.photos/seed/venue5/600/400",
      "address": "Pondok Indah, Jakarta Selatan",
      "price": "180000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 5, "name": "Tenis"},
      "created_at": null,
      "updated_at": null,
    },
    {
      "id": 6,
      "owner_id": 1,
      "category_id": 1,
      "name": "Futsal Gelora Kemang",
      "description": "Lapangan outdoor + indoor, cafe & musholla.",
      "image": "https://picsum.photos/seed/venue6/600/400",
      "address": "Jl. Kemang Raya No.45, Jakarta",
      "price": "120000",
      "link_maps": "https://maps.google.com",
      "owner": {"id": 1, "name": "Gelora Management"},
      "category": {"id": 1, "name": "Futsal"},
      "created_at": null,
      "updated_at": null,
    },
  ];

  static List<Map<String, dynamic>> venuesByCategory(int categoryId) {
    return venues.where((v) => v['category_id'] == categoryId).toList();
  }

  static Map<String, dynamic>? venueById(dynamic id) {
    try {
      return venues.firstWhere((v) => v['id'].toString() == id.toString());
    } catch (_) {
      return venues.first;
    }
  }

  // ---------- SCHEDULE ----------
  static Map<String, dynamic> scheduleForVenue(dynamic venueId, String date) {
    final venue = venueById(venueId);
    // 8 slot per hari — slicing only
    final slots = [
      {"id": 1, "start_time": "08:00:00", "end_time": "09:00:00", "is_available": true},
      {"id": 2, "start_time": "09:00:00", "end_time": "10:00:00", "is_available": true},
      {"id": 3, "start_time": "10:00:00", "end_time": "11:00:00", "is_available": false},
      {"id": 4, "start_time": "13:00:00", "end_time": "14:00:00", "is_available": true},
      {"id": 5, "start_time": "14:00:00", "end_time": "15:00:00", "is_available": true},
      {"id": 6, "start_time": "19:00:00", "end_time": "20:00:00", "is_available": true},
      {"id": 7, "start_time": "20:00:00", "end_time": "21:00:00", "is_available": true},
      {"id": 8, "start_time": "21:00:00", "end_time": "22:00:00", "is_available": false},
    ];
    return {
      "venue": venue,
      "schedules": slots,
      "date": date,
    };
  }

  // ---------- MARKETPLACE PRODUCTS ----------
  static List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "name": "Molten Basket GG7X",
      "category": "Basket",
      "price": 2595000,
      "image": "assets/basket.png",
      "networkImage": "https://picsum.photos/seed/prod1/400/400",
      "desc": "Bola basket kompetisi kulit sintetis premium.",
    },
    {
      "id": 2,
      "name": "Yonex Astrox 88D",
      "category": "Badminton",
      "price": 1850000,
      "image": "assets/basket.png",
      "networkImage": "https://picsum.photos/seed/prod2/400/400",
      "desc": "Raket badminton untuk pemain ofensif.",
    },
    {
      "id": 3,
      "name": "Sepatu Futsal Specs",
      "category": "Futsal",
      "price": 599000,
      "image": "assets/basket.png",
      "networkImage": "https://picsum.photos/seed/prod3/400/400",
      "desc": "Grip mantap, ringan untuk manuver cepat.",
    },
    {
      "id": 4,
      "name": "Jersey Training Gelora",
      "category": "Apparel",
      "price": 199000,
      "image": "assets/basket.png",
      "networkImage": "https://picsum.photos/seed/prod4/400/400",
      "desc": "Bahan dry-fit adem, sablon tidak luntur.",
    },
  ];

  // ---------- HISTORY ----------
  static List<Map<String, dynamic>> history = [
    {"icon": "assets/f.png", "title": "Futsal", "subtitle": "Gelora Senayan • 20 Des 2024", "amount": "-Rp150.000", "isExpense": true},
    {"icon": "assets/bt.png", "title": "Badminton", "subtitle": "Hall Kuningan • 19 Des 2024", "amount": "Rp80.000", "isExpense": false},
    {"icon": "assets/r.png", "title": "Mini Soccer", "subtitle": "Park Bintaro • 18 Des 2024", "amount": "Rp600.000", "isExpense": false},
  ];

  // ---------- BOOKING MOCK RESULT ----------
  static Map<String, dynamic> bookingResult({venueId, bookingDate, startTime, endTime, totalPayment}) {
    return {
      "id": 999,
      "venue_id": venueId,
      "booking_date": bookingDate,
      "start_time": startTime,
      "end_time": endTime,
      "total_payment": totalPayment?.toString() ?? "150000",
      "status": "confirmed",
    };
  }
}
