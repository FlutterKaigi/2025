// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $ResGen {
  const $ResGen();

  /// Directory path: res/assets
  $ResAssetsGen get assets => const $ResAssetsGen();
}

class $ResAssetsGen {
  const $ResAssetsGen();

  /// File path: res/assets/add_to_apple_wallet.webp
  AssetGenImage get addToAppleWallet =>
      const AssetGenImage('res/assets/add_to_apple_wallet.webp');

  /// File path: res/assets/add_to_google_wallet.svg
  SvgGenImage get addToGoogleWallet =>
      const SvgGenImage('res/assets/add_to_google_wallet.svg');

  /// File path: res/assets/dashumaru_guruguru.webp
  AssetGenImage get dashumaruGuruguru =>
      const AssetGenImage('res/assets/dashumaru_guruguru.webp');

  /// File path: res/assets/dashumaru_magao.webp
  AssetGenImage get dashumaruMagao =>
      const AssetGenImage('res/assets/dashumaru_magao.webp');

  /// File path: res/assets/dashumaru_overflow_2.webp
  AssetGenImage get dashumaruOverflow2 =>
      const AssetGenImage('res/assets/dashumaru_overflow_2.webp');

  /// Directory path: res/assets/fonts
  $ResAssetsFontsGen get fonts => const $ResAssetsFontsGen();

  /// File path: res/assets/google_sign_in_button.webp
  AssetGenImage get googleSignInButton =>
      const AssetGenImage('res/assets/google_sign_in_button.webp');

  /// File path: res/assets/logo.webp
  AssetGenImage get logo => const AssetGenImage('res/assets/logo.webp');

  /// List of all assets
  List<dynamic> get values => [
    addToAppleWallet,
    addToGoogleWallet,
    dashumaruGuruguru,
    dashumaruMagao,
    dashumaruOverflow2,
    googleSignInButton,
    logo,
  ];
}

class $ResAssetsFontsGen {
  const $ResAssetsFontsGen();

  /// Directory path: res/assets/fonts/NotoSansJP
  $ResAssetsFontsNotoSansJPGen get notoSansJP =>
      const $ResAssetsFontsNotoSansJPGen();

  /// Directory path: res/assets/fonts/NotoSansMono
  $ResAssetsFontsNotoSansMonoGen get notoSansMono =>
      const $ResAssetsFontsNotoSansMonoGen();
}

class $ResAssetsFontsNotoSansJPGen {
  const $ResAssetsFontsNotoSansJPGen();

  /// File path: res/assets/fonts/NotoSansJP/NotoSansJP-VariableFont.ttf
  String get notoSansJPVariableFont =>
      'res/assets/fonts/NotoSansJP/NotoSansJP-VariableFont.ttf';

  /// File path: res/assets/fonts/NotoSansJP/OFL.txt
  String get ofl => 'res/assets/fonts/NotoSansJP/OFL.txt';

  /// List of all assets
  List<String> get values => [notoSansJPVariableFont, ofl];
}

class $ResAssetsFontsNotoSansMonoGen {
  const $ResAssetsFontsNotoSansMonoGen();

  /// File path: res/assets/fonts/NotoSansMono/NotoSansMono-VariableFont.ttf
  String get notoSansMonoVariableFont =>
      'res/assets/fonts/NotoSansMono/NotoSansMono-VariableFont.ttf';

  /// File path: res/assets/fonts/NotoSansMono/OFL.txt
  String get ofl => 'res/assets/fonts/NotoSansMono/OFL.txt';

  /// List of all assets
  List<String> get values => [notoSansMonoVariableFont, ofl];
}

class Assets {
  const Assets._();

  static const $ResGen res = $ResGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
