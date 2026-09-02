import '../config/model/resp.dart';
import '../data/mock_data.dart';

/// Slicing only — no network.
class VenueViewmodel {
  Future<Resp> venue() async {
    await Future.delayed(const Duration(milliseconds: 250));
    return Resp(code: 200, message: "OK", data: MockData.venues);
  }

  Future<Resp> detailVenue({venueid}) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return Resp(code: 200, message: "OK", data: MockData.venueById(venueid));
  }

  Future<Resp> category() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return Resp(code: 200, message: "OK", data: MockData.categories);
  }

  Future<Resp> venueByCategory({categoryId}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final filtered = MockData.venuesByCategory(int.tryParse(categoryId.toString()) ?? categoryId);
    return Resp(code: 200, message: "OK", data: filtered);
  }

  Future<Resp> scheduleVenue({venueID, date}) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final data = MockData.scheduleForVenue(venueID, date ?? "2024-12-20");
    return Resp(code: 200, message: "OK", data: data);
  }
}
