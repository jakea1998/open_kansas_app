import 'package:flutter/material.dart';
import 'package:open_kansas/utils/colors.dart';

Widget button1({required VoidCallback fn, required String text}) =>
    GestureDetector(
        onTap: fn,
        child: Card(
          color: blueColor,
          margin: EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 12),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ));
