import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/formateador.dart';

class TextFieldPersonalizable extends StatelessWidget {
  final String hintText;
  final String type;
  final TextEditingController controller;
  final String keyboard;
  final FocusNode focusNode;

  const TextFieldPersonalizable({
    super.key,
    required this.hintText,
    required this.controller,
    required this.keyboard,
    required this.focusNode, required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 20,
      width: type == 'valor' ? 10 : 50,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.phone,
        inputFormatters: type == 'valor'
        ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(15),
        ]
        : [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
        ],
        style: TextStyle(
          color: Colors.black87,
          fontSize:  type == 'valor' ? 14 : 12,
          fontWeight: type == 'valor' ? FontWeight.bold: null
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: width > 480 ? 15 : 10, left: 5, right: 5),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
          alignLabelWithHint: true,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}