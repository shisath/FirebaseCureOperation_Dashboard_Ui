import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

final controller = Get.put(CurdController());

class DefaultFirebaseOptions {
  static const FirebaseOptions currentPlatform = FirebaseOptions(
      apiKey: "AIzaSyBdJFKxg7-WSrb0eKJNHYCvbYmfJu97wQg",
      authDomain: "firecrudapp-b1f3a.firebaseapp.com",
      projectId: "firecrudapp-b1f3a",
      storageBucket: "firecrudapp-b1f3a.firebasestorage.app",
      messagingSenderId: "130484030618",
      appId: "1:130484030618:web:4afab6dcfacd13db37e323");
}

class TextSizes {
  static const double small = 12.0;
  static const double medium = 14.0;
  static const double regular = 18.0;
  static const double large = 20.0;
  static const double midLarge = 30.0;

  static const double extraLarge = 24.0;
  static const double jumbo = 40.0;
}

class FontWeights {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class AppColors {
  // Primary Colors
  static const Color primaryBlue =
      Color(0xFF1A73E8); // Used in the blue elements
  static const Color primaryOrange = Color(0xFFFFA726); // For orange cards
  static const Color primaryGreen = Color(0xFF66BB6A); // For green cards
  static const Color primaryYellow = Color(0xFFFFD54F); // For yellow cards

  // Backgrounds
  static const Color lightBackground = Color(0xFFF8F9FA);
  static Color lightBlueBackground =
      Colors.blue.withOpacity(0.1); // Light background color
  static const Color sidebarBackground =
      Color(0xFFFFFFFF); // Sidebar white background

  // Text Colors
  static const Color textDark = Color(0xFF202124); // For main text
  static const Color textGrey =
      Color(0xFF5F6368); // For secondary text and labels
  static const Color textBlue = Color(0xFF1A73E8); // Highlighted blue text

  // Border and Dividers
  static const Color dividerColor =
      Color(0xFFE0E0E0); // Divider and card borders

  // Sidebar Colors
  static const Color sidebarHover =
      Color(0xFFE8F0FE); // Hover effect for sidebar menu
  static const Color sidebarSelected = Color(0xFF4285F4); // Selected menu item

  // Other UI Elements
  static Color shadow = Colors.black12; // Shadows for cards and buttons
  static const Color notificationRed =
      Color(0xFFEA4335); // Notification dot color
}
