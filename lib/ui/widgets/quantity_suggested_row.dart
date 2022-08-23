import 'package:flutter/material.dart';
import 'package:open_kansas/utils/fonts.dart';

class QuantitySuggestedRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  const QuantitySuggestedRow(
      {Key? key, required this.title,required this.color, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
              child: Text(
            title,
            style: rowStyle1,
          )),
          Text(
            subTitle,
            style: rowStyle2,
          )
        ]),
      ),
    );
  }
}
