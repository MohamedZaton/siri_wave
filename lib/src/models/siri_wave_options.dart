import 'package:flutter/material.dart' show Color, Colors;

/// Describes the configuration will be used by [SiriWave].
class SiriWaveOptions {
  /// Creates a [SiriWaveOptions].
  const SiriWaveOptions({
    this.backgroundColor = Colors.black,
    this.height = 180,
    this.showSupportBar = true,
    this.width = 360,
    this.colorsList = const [
      Color.fromRGBO(173, 57, 76, 1),
      Color.fromRGBO(48, 220, 155, 1),
      Color.fromRGBO(15, 82, 169, 1),
    ],
  });

  /// Background color of the [SiriWave].
  ///
  /// Defaults to [Colors.black].
  @Deprecated(
      'backgroundColor is deprecated, has no effect, and will be removed in a future version.')
  final Color backgroundColor;

  /// Height of the [SiriWave].
  ///
  /// Defaults to `180`.
  final double height;
  /// 3 Colors  List
  final List<Color> colorsList;

  /// Whether to show the support bar on iOS 9 style [SiriWave].
  ///
  /// Defaults to `true`.
  final bool showSupportBar;

  /// Width of the [SiriWave].
  ///
  /// Defaults to `360`.
  final double width;

  @override
  String toString() =>
      'SiriWaveOptions(height: $height, showSupportBar: $showSupportBar, width: $width)';
}
