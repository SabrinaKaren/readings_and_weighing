import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:flutter_spinbox/material.dart';

class SpinFieldWidget extends StatelessWidget {

  final double min;
  final double max;
  final double value;
  final double? spacing;
  final int? decimals;
  final double? step;
  final Function(double)? onChanged;
  final TextStyle? textStyle;
  final double? iconsSize;
  final EdgeInsetsGeometry? inputPadding;

  SpinFieldWidget({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    this.spacing,
    this.decimals,
    this.step,
    this.onChanged,
    this.textStyle,
    this.iconsSize,
    this.inputPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CupertinoSpinBox ios = CupertinoSpinBox(
      min: this.min,
      max: this.max,
      value: this.value,
      spacing: this.spacing ?? 0,
      direction: Axis.vertical,
      textStyle: this.textStyle,
      incrementIcon: Icon(CupertinoIcons.up_arrow, size: this.iconsSize, color: Colors.black54),
      decrementIcon: Icon(CupertinoIcons.down_arrow, size: this.iconsSize, color: Colors.black54),
      padding: this.inputPadding ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white,
          darkColor: CupertinoColors.black,
        ),
        border: Border.all(
          color: CupertinoDynamicColor.withBrightness(
            color: Colors.black54,
            darkColor: Color(0x33FFFFFF),
          ),
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      decimals: this.decimals ?? 0,
      step: this.step ?? 1.0,
      onChanged: this.onChanged,
    );

    SpinBox android = SpinBox(
      min: this.min,
      max: this.max,
      value: this.value,
      spacing: this.spacing ?? 0,
      direction: Axis.vertical,
      textStyle: this.textStyle,
      incrementIcon: Icon(Icons.keyboard_arrow_up, size: this.iconsSize, color: Colors.black54),
      decrementIcon: Icon(Icons.keyboard_arrow_down, size: this.iconsSize, color: Colors.black54),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: this.inputPadding ?? const EdgeInsets.all(1),
      ),
      decimals: this.decimals ?? 0,
      step: this.step ?? 1,
      onChanged: this.onChanged,
    );

    return Visibility(
      visible: Platform.isIOS,
      child: ios,
      replacement: android,
    );

  }

}
