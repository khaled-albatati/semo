import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final TextEditingController myController;

  final String? hint;

  final Function? onSave;
  // final Function? validator;
  final String? Function(String?) validator;


  const CustomTextFormField({
    super.key,
    this.text,
    this.hint,
    this.onSave,
    required this.validator, required this.myController,
  });

   @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 15),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(validator: validator,
        controller: myController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: hint,
          hintText: text,
          hintTextDirection: TextDirection.ltr,
          contentPadding: const EdgeInsets.only(left: 0, right: 5), // Reset horizontal padding
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.grey, // Customize the hint color
          ),
        ),
        textAlign: TextAlign.center, // Center-align the input text
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}