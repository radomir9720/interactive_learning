import 'package:flutter/material.dart';

// ======================= Data ======================= \\
const String kHiveMainBoxKey = 'kHiveMainBoxKey';

// ======================= Models ======================= \\
const kLightThemeKey = 'kLightThemeKey';
const kDarkThemeKey = 'kDarkThemeKey';

// ======================= Design ======================= \\
const double kMainElementsRadiusDouble = 25;
const double kStandardPaddingDouble = 13.0;
const EdgeInsets kStandardPadding = EdgeInsets.all(kStandardPaddingDouble);
const EdgeInsets kStandardMargin = EdgeInsets.only(
  left: kStandardPaddingDouble,
  top: kStandardPaddingDouble,
  right: kStandardPaddingDouble,
);
List<BoxShadow> kStandardBoxShadow = [
  BoxShadow(
    blurRadius: 20,
    color: Colors.black.withOpacity(0.3),
  ),
];
const double kCardBorderRadiusDouble = 15.0;
BorderRadius kCardBorderRadius = BorderRadius.circular(kCardBorderRadiusDouble);
const RoundedRectangleBorder kAppBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(
      kMainElementsRadiusDouble,
    ),
    bottomLeft: Radius.circular(
      kMainElementsRadiusDouble,
    ),
  ),
);

Color kSuccessColor = Colors.green[300];

// ======================= Network ======================= \\
Map<String, dynamic> kRequestHeaders = {'Content-type': 'application/json'};

// ======================= Other ======================= \\

const Map<int, Map<String, String>> months = {
  1: {'fullDeclination': 'января', 'short': 'янв'},
  2: {'fullDeclination': 'февраля', 'short': 'фев'},
  3: {'fullDeclination': 'марта', 'short': 'мар'},
  4: {'fullDeclination': 'апреля', 'short': 'апр'},
  5: {'fullDeclination': 'мая', 'short': 'май'},
  6: {'fullDeclination': 'июня', 'short': 'июнь'},
  7: {'fullDeclination': 'июля', 'short': 'июль'},
  8: {'fullDeclination': 'августа', 'short': 'авг'},
  9: {'fullDeclination': 'сентября', 'short': 'сен'},
  10: {'fullDeclination': 'октября', 'short': 'окт'},
  11: {'fullDeclination': 'ноября', 'short': 'ноя'},
  12: {'fullDeclination': 'декабря', 'short': 'дек'},
};
