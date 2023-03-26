import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/app_color.dart';

class DWalletLoader extends StatefulWidget {
  const DWalletLoader({super.key});

  @override
  State<DWalletLoader> createState() => _DWalletLoaderState();
}

class _DWalletLoaderState extends State<DWalletLoader>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              // changes position of shadow
            ),
          ],
        ),
        child: const SpinKitThreeBounce(
          color: AppColors.primaryGreen,
          size: 30.0,
        ),
      )),
    );
  }
}
