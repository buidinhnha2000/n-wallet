import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../extensions/context.dart';

class DWalletTextValidation extends StatelessWidget {
  const DWalletTextValidation({Key? key, required this.textValidator})
      : super(key: key);
  final String textValidator;

  @override
  Widget build(BuildContext context) {
    return Text(textValidator,
        style: context.textTheme.bodySmall
            ?.copyWith(color: Colors.red, fontSize: 13));
  }
}
