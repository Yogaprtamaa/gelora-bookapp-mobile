import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../config/app_color.dart';


class DropdownButtonCustom extends StatelessWidget {
  const DropdownButtonCustom(
      {super.key,
        this.value,
        this.items,
        this.hintText,
        this.textValidator,
        this.onChanged,
        this.onSaved});
  final List<DropdownMenuItem<String>>? items;
  final String? hintText;
  final String? textValidator;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      items: items,
      isExpanded: true,
      decoration: const InputDecoration(
        fillColor: AppColor.white,
        filled: true,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Color(0xFFE8EDF1))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8EDF1))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8EDF1))),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
      ),
      hint: Text(hintText ?? "",
          style: fontTextStyle.copyWith(color: const Color(0xff878E97))),
      style: fontTextStyle.copyWith(color: const Color(0xff878E97)),
      validator: (value) {
        if (value == null) {
          return textValidator ?? "";
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColor.black,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}