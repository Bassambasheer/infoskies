import 'package:flutter/material.dart';
import 'package:infoskies/core/constantwidgets/textwidget.dart';

import '../../theme/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.txt,
    required this.ontap,
  }) : super(key: key);
  final String txt;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      color: constant,
      onPressed: () {
        ontap();
      },
      child: TextWidget(
        txt: txt,
        clr: white,
        size: 22,
      ),
    );
  }
}
