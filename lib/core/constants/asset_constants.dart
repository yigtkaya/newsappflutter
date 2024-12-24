import 'package:flutter/material.dart';

@immutable

/// AssetConstants class.
final class AssetConstants {
  /// AssetIcons instance.
  static AssetIcons icons = AssetIcons();

  /// AssetImages instance.
  static AssetImages images = AssetImages();

  /// Lottie asset path.
  static String toLotti(String name) => 'assets/lottie/$name.json';

  /// Jpg asset path.
  static String toJpg(String name) => 'assets/images/$name.jpg';

  /// Jpeg asset path.
  static String toJpeg(String name) => 'assets/images/$name.jpeg';

  /// Png asset path.
  static String toPng(String name) => 'assets/images/$name.png';

  /// Svg asset path.
  static String toIcon(String name) => 'assets/icons/ic_$name.svg';

  /// Json asset path.
  static String toJson(String name) => 'assets/mock/$name.json';

  /// Video asset path.
  static String toVideo(String name) => 'assets/videos/$name.mp4';
}

@immutable

/// AssetIcons class.
final class AssetIcons {
  /// Audio icon.
  final String audio = AssetConstants.toIcon('audio_icon');

  /// Google icon.
  final String google = AssetConstants.toIcon('google_icon');

  /// Add trip icon.
  final String addTrip = AssetConstants.toIcon('add_trip');

  /// Road icon.
  final String road = AssetConstants.toIcon('road');

  /// Total rides icon.
  final String totalRides = AssetConstants.toIcon('task');

  /// Completed icon.
  final String cancel = AssetConstants.toIcon('cancel_square');

  /// Car icon.
  final String car = AssetConstants.toIcon('car');

  /// Send icon.
  final String send = AssetConstants.toIcon('paper_plane');
}

@immutable

/// AssetImages class.
final class AssetImages {
  /// News logo image.
  final String newsLogo = AssetConstants.toPng('newsapplogo');
}

@immutable

/// AssetVideos class.
final class AssetVideos {
  /// Onboarding video.
  final String onboarding = AssetConstants.toVideo('onboarding');
}
