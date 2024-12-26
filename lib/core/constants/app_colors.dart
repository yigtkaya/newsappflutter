import 'package:flutter/material.dart';

@immutable

/// AppColors class
final class AppColors {
  /// Constructor
  const AppColors._();

  //*COMMON COLORS
  static Color get kBackground => const Color(0xFFF5F5F5);
  static Color get kWhite => Colors.white;
  static Color get kBlack => Colors.black;
  static Color get kPurple => const Color(0xFF613EEF);
  static Color get kTaksi => const Color(0xFFF5E0A8); // Taksi color
  static Color get kRed100 => const Color(0xFFDA4949); // Red color 100%
  static Color get kSolukYellow => const Color.fromRGBO(255, 191, 67, 1);
  static Color get kDarkBlue => const Color.fromARGB(255, 76, 133, 227);

  //?PRIMARY COLORS
  static Color get kPrimary100 => const Color(0xFFE2725B);
  static Color get kPrimary75 => const Color(0xBFE2725B);
  static Color get kPrimary50 => const Color(0x80E2725B);
  static Color get kPrimary15 => const Color(0x26E2725B);
  static Color get kPrimary7 => const Color(0x12E2725B);
  static Color get kPrimarySoluk => const Color(0xFFF1B9AD);

  //?GREY COLORS
  static Color get kGreyDark => const Color(0xFFF9FCFE);
  static Color get kGrey => const Color(0xFFBABABA);
  static Color get kGreyLight1 => const Color(0xFFF6F6F6);
  static Color get kGreyLight2 => const Color(0xFFF3F3F3);

  //?ACCENT COLORS
  static Color get kAccent => const Color(0xFFFFC120); // Accent color

  //?SECONDARY COLORS
  static Color get kSecondary900 => const Color(0xFF3B464E);
  static Color get kSecondary800 => const Color(0xFF4E5B65);
  static Color get kSecondary700 => const Color(0xFF62707B);
  static Color get kSecondary600 => const Color(0xFF778692);
  static Color get kSecondary500 => const Color(0xFF8C9CA9);
  static Color get kSecondary400 => const Color(0xFFA3B3BF);
  static Color get kSecondary300 => const Color(0xFFBAC9D6);
  static Color get kSecondary200 => const Color(0xFFD2E1ED);
  static Color get kSecondary100 => const Color(0xFFE6F4FF);

  //*SUCCESS COLORS
  static Color get kSuccess900 => const Color(0xFF068133);
  static Color get kSuccess800 => const Color(0xFF12A347);
  static Color get kSuccess700 => const Color(0xFF22C55E);
  static Color get kSuccess600 => const Color(0xFF36E777);
  static Color get kSuccess500 => const Color(0xFF4CFF8E);
  static Color get kSuccess400 => const Color(0xFF74FFA7);
  static Color get kSuccess300 => const Color(0xFF9CFFC1);
  static Color get kSuccess200 => const Color(0xFFC5FFDA);
  static Color get kSuccess100 => const Color(0xFFEDFFF3);

  //!DANGER COLORS
  static Color get kDanger900 => const Color(0xFF450303);
  static Color get kDanger800 => const Color(0xFF891313);
  static Color get kDanger700 => const Color(0xFFAB2020);
  static Color get kDanger600 => const Color(0xFFCD3030);
  static Color get kDanger500 => const Color(0xFFEF4444);
  static Color get kDanger400 => const Color(0xFFFE7171);
  static Color get kDanger300 => const Color(0xFFFF9A9A);
  static Color get kDanger200 => const Color(0xFFFFC4C4);
  static Color get kDanger100 => const Color(0xFFFFEDED);

  //*WARNING COLORS
  static Color get kWarning900 => const Color(0xFF775A00);
  static Color get kWarning800 => const Color(0xFF997608);
  static Color get kWarning700 => const Color(0xFFBB9213);
  static Color get kWarning600 => const Color(0xFFDDB022);
  static Color get kWarning500 => const Color(0xFFFFCE35);
  static Color get kWarning400 => const Color(0xFFFFD962);
  static Color get kWarning300 => const Color(0xFFFFE490);
  static Color get kWarning200 => const Color(0xFFFFEFBD);
  static Color get kWarning100 => const Color(0xFFFFFAEB);

  //?INFO COLORS
  static Color get kInfo900 => const Color(0xFF00404D);
  static Color get kInfo800 => const Color(0xFF006276);
  static Color get kInfo700 => const Color(0xFF00849E);
  static Color get kInfo600 => const Color(0xFF00A6C7);
  static Color get kInfo500 => const Color(0xFF0DCAF0);
  static Color get kInfo400 => const Color(0xFF39DEFF);
  static Color get kInfo300 => const Color(0xFF65E5FF);
  static Color get kInfo200 => const Color(0xFF90ECFF);
  static Color get kInfo100 => const Color(0xFFBBF3FF);
}
