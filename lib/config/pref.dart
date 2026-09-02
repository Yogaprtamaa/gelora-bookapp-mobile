import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Session {
  final storage = const FlutterSecureStorage();

  final String userToken = "user_token";
  final String userId = "user_id";
  final String tokenFCM = "token_fcm";
  final String welcome = "welcome";
  final String preTest = "pre_test";
  final String username = "username";
  final String userLogin = "user_login";
  final String tourGuide = "tour_guide";


  Future<void> setUserToken(dynamic value) async {
    return await storage.write(key: userToken, value: value);
  }

  Future<String?> getUserToken() async {
    return await storage.read(key: userToken);
  }

  Future<void> setUserId(dynamic value) async {
    return await storage.write(key: userId, value: value);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: userId);
  }

  Future<void> setTokenFCM(dynamic value) async {
    return await storage.write(key: tokenFCM, value: value);
  }

  Future<String?> getTokenFCM() async {
    return await storage.read(key: tokenFCM);
  }

  Future<void> setUsername(dynamic value) async {
    return await storage.write(key: username, value: value);
  }

  Future<String?> getUsername() async {
    return await storage.read(key: username);
  }

  // Future<void> setOnboarding({bool? value}) async {
  //   return await storage.write(key: onboarding, value: value.toString());
  // }
  //
  // Future<bool> getOnboarding() async {
  //   String? isShowed = await storage.read(key: onboarding);
  //   isShowed ?? "false";
  //   return bool.parse(isShowed ?? "false");
  // }

  // Future<void> setWelcome({bool? value}) async {
  //   return await storage.write(key: onboarding, value: value.toString());
  // }

  Future<void> setUserLogin({bool? value}) async {
    return await storage.write(key: userLogin, value: value.toString());
  }

  Future<bool> getUserLogin() async {
    String? isShowed = await storage.read(key: userLogin);
    isShowed ?? "false";
    return bool.parse(isShowed ?? "false");
  }

  Future<void> setPreTest({bool? value}) async {
    return await storage.write(key: preTest, value: value.toString());
  }

  Future<bool> getPreTest() async {
    String? isShowed = await storage.read(key: preTest);
    isShowed ?? "false";
    return bool.parse(isShowed ?? "false");
  }

  Future<void> setTourGuide({bool? value}) async {
    return await storage.write(key: tourGuide, value: value.toString());
  }

  Future<bool> getTourGuide() async {
    String? isShowed = await storage.read(key: tourGuide);
    isShowed ?? "false";
    return bool.parse(isShowed ?? "false");
  }

  // Future<bool> getWelcome() async {
  //   String? isShowed = await storage.read(key: onboarding);
  //   isShowed ?? "false";
  //   return bool.parse(isShowed ?? "false");
  // }

  logout() async {
    // await storage.delete(key: popUpAds);
    // await storage.delete(key: currentDate);
    await storage.delete(key: userToken);
    await storage.delete(key: userId);
    await storage.delete(key: username);
    await storage.delete(key: userLogin);
    await storage.delete(key: preTest);
    await storage.delete(key: tourGuide);
    // await storage.delete(key: onboarding);
    // await storage.delete(key: welcome);
    // await storage.delete(key: tokenFCM);
  }
}