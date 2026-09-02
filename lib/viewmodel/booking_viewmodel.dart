import '../config/model/resp.dart';
import '../data/mock_data.dart';

/// Slicing only — no network. Booking always succeeds (201)
class BookingViewmodel {
  Future<Resp> booking({venueId, categoryId, bookingDate, startTime, endTime, taxPercentage, totalPayment}) async {
    await Future.delayed(const Duration(milliseconds: 350));
    final data = MockData.bookingResult(
      venueId: venueId,
      bookingDate: bookingDate,
      startTime: startTime,
      endTime: endTime,
      totalPayment: totalPayment,
    );
    return Resp(code: 201, message: "Booking berhasil — Gelora", data: data);
  }
}
