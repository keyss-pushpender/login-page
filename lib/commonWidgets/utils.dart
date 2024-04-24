import 'package:flutter/material.dart';

SizedBox vGap({double height = 20.0}) => SizedBox(height: height);

SizedBox hGap({double width = 20.0}) => SizedBox(width: width);

OutlineInputBorder textFieldBorder() =>
    const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
    );

OutlineInputBorder focusedTextFieldBorder() =>
    const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.purple)
    );
