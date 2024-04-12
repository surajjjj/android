import 'package:egrocer/core/constant/constant.dart';
import 'package:egrocer/core/widgets/generalMethods.dart';
import 'package:egrocer/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final VoidCallback voidCallback;

  const ConfirmButtonWidget({Key? key, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Constant.size15, vertical: Constant.size15),
      child: Widgets.gradientBtnWidget(
        context,
        10,
        title: getTranslatedValue(
          context,
          "lblConfirmLocation",
        ),
        callback: voidCallback,
      ),
    );
  }
}
