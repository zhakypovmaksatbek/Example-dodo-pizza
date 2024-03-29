enum SvgAsset {
  kyrgyzstan,
  circle,
  logo,
  truck,
  truck2,
  city,
  success,
  banner,
  banner2,
  banner3,
  cheesecake,
  cheesecake2,
  cheesecake3,
  chips,
  coffee,
  coffee2,
  coffee3,
  drink,
  drink2,
  juice,
  ketchup,
  mayonez,
  milkshake,
  milkshake2,
  orozo,
  pasta,
  pasta2,
  pizza,
  pizza2,
  pizza3,
  pizza4,
}

extension SvgExtention on SvgAsset {
  String get svg => 'assets/svg/$name.svg';
  String get jpeg => 'assets/png/$name.jpeg';
  String get png => 'assets/png/$name.png';
}
