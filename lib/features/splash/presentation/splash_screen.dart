import 'package:cmstask_repo/features/helper/colors.dart';
import 'package:cmstask_repo/features/helper/constants.dart';
import 'package:cmstask_repo/features/helper/routes/routes.dart';
import 'package:cmstask_repo/features/helper/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset(Assets.appIcon,
                height: 200, width: 200, fit: BoxFit.cover),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constants.appName,
                  style: TextStyles.boldBlackTextStyle,
                ),
                Text(
                  Constants.byCms,
                  style: TextStyles.regularBlackTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
