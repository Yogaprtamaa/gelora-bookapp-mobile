import '../config/model/resp.dart';
import '../data/mock_data.dart';

/// Slicing only — no network. All auth is mock.
class AuthViewmodel {
  Future<Resp> login({email, password}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    // Slicing: always success, any credential accepted
    return Resp(
      code: 200,
      message: "Login berhasil — Gelora",
      data: {
        "access_token": "mock_token_gelora_${DateTime.now().millisecondsSinceEpoch}",
        "user": MockData.user,
      },
    );
  }

  Future<Resp> register({name, email, phone, password, confirmPassword}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return Resp(code: 200, message: "Registrasi berhasil", data: MockData.user);
  }

  Future<Resp> logout() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return Resp(code: 200, message: "Logout berhasil", data: null);
  }

  Future<Resp> userDetail() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return Resp(code: 200, message: "OK", data: MockData.user);
  }

  Future<Resp> requestCode({email}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Resp(code: 200, message: "Kode dikirim ke $email", data: null);
  }

  Future<Resp> resetPassword({code, password}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Resp(code: 200, message: "Password direset", data: null);
  }

  Future<Resp> editProfile({name, phone}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final updated = Map<String, dynamic>.from(MockData.user)
      ..['name'] = name ?? MockData.user['name']
      ..['phone'] = phone ?? MockData.user['phone'];
    return Resp(code: 200, message: "Profil diperbarui", data: updated);
  }
}
