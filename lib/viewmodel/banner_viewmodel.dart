import '../config/model/resp.dart';
import '../data/mock_data.dart';

/// Slicing only — no network.
class BannerViewmodel {
  Future<Resp> banner() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return Resp(code: 200, message: "OK", data: MockData.banners);
  }

  Future<Resp> detailVenue({bannerid}) async {
    await Future.delayed(const Duration(milliseconds: 150));
    final b = MockData.banners.firstWhere((e) => e['id'].toString() == bannerid.toString(), orElse: () => MockData.banners.first);
    return Resp(code: 200, message: "OK", data: b);
  }
}
