import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatters {

  TextInputFormatter maskTextInputFormatter(String mask, {Map<String, RegExp>? filter, String? initialText}) {
    return MaskTextInputFormatter(mask: mask);
  }

}