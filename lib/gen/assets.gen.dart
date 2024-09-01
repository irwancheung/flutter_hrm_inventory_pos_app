/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_rounded.svg
  String get addRounded => 'assets/icons/add_rounded.svg';

  /// Directory path: assets/icons/alert
  $AssetsIconsAlertGen get alert => const $AssetsIconsAlertGen();

  /// File path: assets/icons/clock_in.svg
  String get clockIn => 'assets/icons/clock_in.svg';

  /// File path: assets/icons/email.svg
  String get email => 'assets/icons/email.svg';

  /// File path: assets/icons/grand_total.svg
  String get grandTotal => 'assets/icons/grand_total.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/logout_circle.svg
  String get logoutCircle => 'assets/icons/logout_circle.svg';

  /// Directory path: assets/icons/nav
  $AssetsIconsNavGen get nav => const $AssetsIconsNavGen();

  /// File path: assets/icons/password.svg
  String get password => 'assets/icons/password.svg';

  /// File path: assets/icons/pos.svg
  String get pos => 'assets/icons/pos.svg';

  /// File path: assets/icons/setting_circle.svg
  String get settingCircle => 'assets/icons/setting_circle.svg';

  /// List of all assets
  List<String> get values => [
        addRounded,
        clockIn,
        email,
        grandTotal,
        logout,
        logoutCircle,
        password,
        pos,
        settingCircle
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_login.png
  AssetGenImage get bgLogin =>
      const AssetGenImage('assets/images/bg_login.png');

  /// File path: assets/images/logo_primary.png
  AssetGenImage get logoPrimary =>
      const AssetGenImage('assets/images/logo_primary.png');

  /// File path: assets/images/logo_white.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/images/logo_white.png');

  /// Directory path: assets/images/menu
  $AssetsImagesMenuGen get menu => const $AssetsImagesMenuGen();

  /// List of all assets
  List<AssetGenImage> get values => [bgLogin, logoPrimary, logoWhite];
}

class $AssetsIconsAlertGen {
  const $AssetsIconsAlertGen();

  /// File path: assets/icons/alert/empty.png
  AssetGenImage get empty =>
      const AssetGenImage('assets/icons/alert/empty.png');

  /// File path: assets/icons/alert/error.png
  AssetGenImage get error =>
      const AssetGenImage('assets/icons/alert/error.png');

  /// File path: assets/icons/alert/success.png
  AssetGenImage get success =>
      const AssetGenImage('assets/icons/alert/success.png');

  /// List of all assets
  List<AssetGenImage> get values => [empty, error, success];
}

class $AssetsIconsNavGen {
  const $AssetsIconsNavGen();

  /// File path: assets/icons/nav/attendance.svg
  String get attendance => 'assets/icons/nav/attendance.svg';

  /// File path: assets/icons/nav/dashboard.svg
  String get dashboard => 'assets/icons/nav/dashboard.svg';

  /// File path: assets/icons/nav/departements.svg
  String get departements => 'assets/icons/nav/departements.svg';

  /// File path: assets/icons/nav/designations.svg
  String get designations => 'assets/icons/nav/designations.svg';

  /// File path: assets/icons/nav/holidays.svg
  String get holidays => 'assets/icons/nav/holidays.svg';

  /// File path: assets/icons/nav/leaves.svg
  String get leaves => 'assets/icons/nav/leaves.svg';

  /// File path: assets/icons/nav/payroll.svg
  String get payroll => 'assets/icons/nav/payroll.svg';

  /// File path: assets/icons/nav/settings.svg
  String get settings => 'assets/icons/nav/settings.svg';

  /// File path: assets/icons/nav/shifts.svg
  String get shifts => 'assets/icons/nav/shifts.svg';

  /// File path: assets/icons/nav/staff_member.svg
  String get staffMember => 'assets/icons/nav/staff_member.svg';

  /// File path: assets/icons/nav/user_management.svg
  String get userManagement => 'assets/icons/nav/user_management.svg';

  /// List of all assets
  List<String> get values => [
        attendance,
        dashboard,
        departements,
        designations,
        holidays,
        leaves,
        payroll,
        settings,
        shifts,
        staffMember,
        userManagement
      ];
}

class $AssetsImagesMenuGen {
  const $AssetsImagesMenuGen();

  /// File path: assets/images/menu/all_product.png
  AssetGenImage get allProduct =>
      const AssetGenImage('assets/images/menu/all_product.png');

  /// File path: assets/images/menu/electronic.png
  AssetGenImage get electronic =>
      const AssetGenImage('assets/images/menu/electronic.png');

  /// File path: assets/images/menu/fashion.png
  AssetGenImage get fashion =>
      const AssetGenImage('assets/images/menu/fashion.png');

  /// File path: assets/images/menu/furniture.png
  AssetGenImage get furniture =>
      const AssetGenImage('assets/images/menu/furniture.png');

  /// File path: assets/images/menu/grocery.png
  AssetGenImage get grocery =>
      const AssetGenImage('assets/images/menu/grocery.png');

  /// File path: assets/images/menu/headphone.png
  AssetGenImage get headphone =>
      const AssetGenImage('assets/images/menu/headphone.png');

  /// File path: assets/images/menu/mineral.png
  AssetGenImage get mineral =>
      const AssetGenImage('assets/images/menu/mineral.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [allProduct, electronic, fashion, furniture, grocery, headphone, mineral];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
