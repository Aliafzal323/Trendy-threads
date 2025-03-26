// ignore_for_file: constant_identifier_names

enum AssetIcons {
  google_icon,
  blank,
  facebook_icon;

  factory AssetIcons.fromName(String? name) => AssetIcons.values.firstWhere(
        (e) => e.name == name,
        orElse: () => AssetIcons.blank,
      );
}

enum AssetIconType {
  monotone,
  multicolor,
  ;

  static const all = values;
}

extension AssetIconsX on AssetIcons {
  static const String _basePath = 'assets/icons';

  String asset(AssetIconType type) => '$_basePath/$name.svg';
}
