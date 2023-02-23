import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/extensions/context.dart';
import '../../../theme/app_color.dart';

class ButtonOption extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;
  final Color? color;
  final String? img;

  const ButtonOption(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.img})
      : super(key: key);

  @override
  _ButtonOptionState createState() => _ButtonOptionState();
}

class _ButtonOptionState extends State<ButtonOption> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
              EdgeInsets.only(left: 8, right: 8)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                side: BorderSide(color: AppColors.buttonBorder, width: 2)),
          ),
        ),
        onPressed:() async{
          await widget.onPressed!();
        },
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 38,
                      width: 38,
                      decoration: const BoxDecoration(
                          color: AppColors.buttonWhite,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: SvgPicture.asset(
                        '${widget.img}',
                        height: 18,
                        width: 9.34,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 6,
                      child: Text(
                        widget.text,
                        style: context.textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    const Expanded(flex: 2,child: SizedBox(),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
