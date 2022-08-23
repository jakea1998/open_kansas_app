import 'package:flutter/material.dart';
import 'package:open_kansas/utils/fonts.dart';

class QuantitySuggestedHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const QuantitySuggestedHeader(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
              child: Text(
            title,
            style: headerStyle,
          )),
          Text(
            subTitle,
            style: headerStyle,
          )
        ]),
      ),
    );
  }
}
