import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// GELORA — brand palette (rebranded from Lapon)
/// Vibe: modern sport hub, energetic, premium.
/// Primary violet-indigo + tangerine accent + cyan spark.
class AppColor {
  // === BRAND CORE ===
  static const Color primary = Color(0xFF5B2EFF);          // vivid violet
  static const Color primaryDark = Color(0xFF1A1033);      // deep indigo-navy
  static const Color primaryLight = Color(0xFFEEE8FF);     // lavender bg
  static const Color secondary = Color(0xFF06B6D4);         // cyan spark
  static const Color accent = Color(0xFFFF6B2C);            // tangerine
  static const Color accentSoft = Color(0xFFFFE8DE);

  // === NEUTRALS ===
  static const Color ink = Color(0xFF0F172A);              // slate 900
  static const Color inkLight = Color(0xFF64748B);         // slate 500
  static const Color inkFaint = Color(0xFF94A3B8);
  static const Color line = Color(0xFFE2E8F0);
  static const Color background = Color(0xFFF8F7FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF1F5F9);

  // === SEMANTIC ===
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);

  // === LEGACY ALIASES (kept for compat, now map to new palette) ===
  static const Color colorPrimaryGreen = primary;
  static const Color colorPrimaryYellow = accent;
  static const Color colorPrimaryNavyBlue = primaryDark;
  static const Color colorRed = danger;

  static const Color black = ink;
  static const Color white = surface;
}

TextStyle fontTextStyle = GoogleFonts.plusJakartaSans();
TextStyle headingStyle = GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w800);