import 'package:flutter/material.dart';

import '../../../common/extensions/context.dart';
import '../../../theme/app_color.dart';

class ButtonCheck extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final String? img;

  const ButtonCheck(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.img})
      : super(key: key);

  @override
  _ButtonCheckState createState() => _ButtonCheckState();
}

class _ButtonCheckState extends State<ButtonCheck> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            height: 54,
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                foregroundColor: MaterialStateProperty.all<Color>(AppColors.textWhite),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(widget.color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      side: BorderSide.none),
                ),
              ),
              onPressed: () {
                widget.onPressed?.call();
              },
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.img != null
                            ? Container(
                                padding: const EdgeInsets.only(bottom: 2),
                                height: 20,
                                width: 18,
                                child: Image.asset(
                                  widget.img ?? '',
                                  color: AppColors.textWhite,
                                  fit: BoxFit.fill,
                                ))
                            : const Text(''),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          widget.text,
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: AppColors.textWhite, fontSize: 16),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
