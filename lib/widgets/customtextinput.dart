import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextInput extends StatelessWidget {
  final String? text;

  final String? hintText;

  // final Function? onSave;
  // final Function? validator;

  const CustomTextInput({
    super.key,
    this.text,
    this.hintText,
    // this.onSave,
    // this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          // onSaved: onSave as void Function(String?)?,
          // validator: validator as String? Function(String?)?,
          decoration: InputDecoration(
            hintText: hintText!,
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            fillColor: Colors.white,
          ),
        )
      ],
    );
  }
}
