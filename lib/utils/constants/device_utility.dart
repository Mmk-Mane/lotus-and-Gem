import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MKDeviceUtils {
  /// Hide the keyboard by removing focus from the current input field.
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Set the status bar color.
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Check if the device is in landscape orientation.
  static bool isLandscapeOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Check if the device is in portrait orientation.
  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Enable or disable full-screen mode.
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  /// Get the screen height.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Get the screen width.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get the pixel ratio of the device.
  static double getPixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Get the height of the status bar.
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  /// Get the bottom navigation bar height.
  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  /// Get the AppBar height.
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  /// Get the keyboard height if visible.
  static double getKeyboardHeight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }

  /// Check if the keyboard is visible.
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  /// Check if the app is running on a physical device.
  static bool isPhysicalDevice() {
    return Platform.isAndroid || Platform.isIOS;
  }

  /// Trigger a vibration for a specified duration.
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  /// Set preferred orientations for the app.
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hide the status bar.
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Show the status bar.
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  /// Check for an internet connection.
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Check if the app is running on iOS.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Check if the app is running on Android.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // Add more device utility methods as needed for your project.
}
