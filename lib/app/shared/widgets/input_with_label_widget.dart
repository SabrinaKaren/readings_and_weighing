import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWithLabelWidget extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final bool? obscure;
  final bool? autofocus;
  final TextInputType? type;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final Widget? suffixIcon;
  final double? labelSize;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final double? errorFontSize;
  final int? errorMaxLines;
  final String? hintText;

  const InputWithLabelWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscure,
    this.autofocus,
    this.type,
    this.maxLines,
    this.inputFormatters,
    this.validator,
    this.onSaved,
    this.fontSize,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.labelSize,
    this.onChanged,
    this.prefixIcon,
    this.textInputAction,
    this.errorFontSize,
    this.errorMaxLines,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 2),
          child: Text(
            this.labelText,
            style: TextStyle(
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
        TextFormField(
          controller: this.controller,
          obscureText: this.obscure ?? false,
          autofocus: this.autofocus ?? false,
          keyboardType: this.type ?? TextInputType.text,
          inputFormatters: this.inputFormatters,
          validator: this.validator,
          maxLines: this.maxLines ?? 1,
          onSaved: this.onSaved,
          style: TextStyle(fontSize: fontSize ?? 20),
          decoration: InputDecoration(
            suffixIcon: this.suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenHeight * 0.028, screenWidth * 0.04, -20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            errorStyle: TextStyle(
              fontSize: this.errorFontSize ?? 0,
            ),
            prefixIcon: this.prefixIcon,
            errorMaxLines: this.errorMaxLines,
            hintText: this.hintText,
            hintStyle: TextStyle(fontSize: fontSize ?? 20),
          ),
          onTap: this.onTap,
          readOnly: this.readOnly ?? false,
          onChanged: this.onChanged,
          textInputAction: this.textInputAction,
        ),
      ],
    );

  }

}
