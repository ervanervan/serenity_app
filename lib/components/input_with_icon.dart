import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/utils/text_style.dart';

class InputWithIcon extends StatelessWidget {
  final String icon;
  final String hintname;
  final TextEditingController controller;

  const InputWithIcon(
      {super.key,
      required this.controller,
      required this.icon,
      required this.hintname});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffEEEEEE),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(icon),
          ),
          Expanded(
            child: TextField(
              style: InputField,
              controller: controller,
              decoration: InputDecoration(
                hintStyle: InputField,
                hintText: hintname,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
