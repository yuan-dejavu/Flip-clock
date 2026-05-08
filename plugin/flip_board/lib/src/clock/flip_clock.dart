import 'dart:async';

import 'package:flutter/material.dart';

import '../../flip_widget.dart';
import 'flip_clock_builder.dart';

/// FlipClock display with current time.
///
/// Display a row of [FlipWidget] to show the current time digits,
/// this digits are refreshed by a stream of [DateTime].now() instances.
/// Since FlipWidget animates only changes, just digits that actually
/// change between seconds are flipped.
class FlipClock extends StatelessWidget {
  FlipClock({
    Key? key,
    required double digitSize,
    required double width,
    required double height,
    AxisDirection flipDirection = AxisDirection.down,
    this.showSeconds = true,
    Curve? flipCurve,
    Color? digitColor,
    Color? digitShadowColor,
    Color? backgroundColor,
    double? separatorWidth,
    Color? separatorColor,
    Color? separatorBackgroundColor,
    bool? showBorder,
    double? borderWidth,
    Color? borderColor,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(4.0)),
    double hingeWidth = 0.8,
    double? hingeLength,
    Color? hingeColor,
    EdgeInsets digitSpacing = const EdgeInsets.symmetric(horizontal: 2.0),
  })  : assert(hingeLength == null ||
            hingeWidth == 0.0 && hingeLength == 0.0 ||
            hingeWidth > 0.0 && hingeLength > 0.0),
        assert((borderWidth == null && borderColor == null) ||
            (showBorder == null || showBorder == true)),
        _displayBuilder = FlipClockBuilder(
          digitSize: digitSize,
          width: width,
          height: height,
          flipDirection: flipDirection,
          flipCurve: flipCurve ??
              (flipDirection == AxisDirection.down
                  ? FlipWidget.bounceFastFlip
                  : FlipWidget.defaultFlip),
          digitColor: digitColor,
          digitShadowColor: digitShadowColor,
          backgroundColor: backgroundColor,
          separatorWidth: separatorWidth ?? width / 3.0,
          separatorColor: separatorColor,
          separatorBackgroundColor: separatorBackgroundColor,
          showBorder: showBorder ?? (borderColor != null || borderWidth != null),
          borderWidth: borderWidth,
          borderColor: borderColor,
          borderRadius: borderRadius,
          hingeWidth: hingeWidth,
          hingeLength: hingeWidth == 0.0
              ? 0.0
              : hingeLength ??
                  (flipDirection == AxisDirection.down ||
                          flipDirection == AxisDirection.up
                      ? width
                      : height),
          hingeColor: hingeColor,
          digitSpacing: digitSpacing,
        ),
        super(key: key);

  final FlipClockBuilder _displayBuilder;
  final bool showSeconds;

  @override
  Widget build(BuildContext context) {
    final initValue = DateTime.now();
    final timeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    ).asBroadcastStream();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHourDisplay(timeStream, initValue),
        _displayBuilder.buildSeparatorEmpty(context),
        _buildMinuteDisplay(timeStream, initValue),
        if (showSeconds) ...[
          _displayBuilder.buildSeparatorEmpty(context),
          _buildSecondDisplay(timeStream, initValue),
        ],
      ],
    );
  }

  Widget _buildHourDisplay(Stream<DateTime> timeStream, DateTime initValue) =>
      _displayBuilder.buildTimePartDisplay(
          timeStream.map((time) => time.hour), initValue.hour);

  Widget _buildMinuteDisplay(Stream<DateTime> timeStream, DateTime initValue) =>
      _displayBuilder.buildTimePartDisplay(
          timeStream.map((time) => time.minute), initValue.minute);

  Widget _buildSecondDisplay(Stream<DateTime> timeStream, DateTime initValue) =>
      _displayBuilder.buildTimePartDisplay(
          timeStream.map((time) => time.second), initValue.second);
}

