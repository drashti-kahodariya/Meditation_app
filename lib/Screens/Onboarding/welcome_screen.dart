import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var authenticationController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomWidget.customAssetImageWidget(
            image: Assets.assetsSplashBg,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 44.h,
                width: 70.w,
                child: CustomWidget.customAssetImageWidget(
                  image: Assets.assetsWelcomeYoga,

                  // fit: BoxFit.cover,
                ),
              ),
              CustomWidget.text(S.of(context).welcome,
                  fontSize: 30, fontWeight: FontWeight.w600),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomWidget.text(
                    S
                        .of(context)
                        .createAnAccountToGetStartedOnYourHealthAndHappinessJourney,
                    fontSize: 10,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      authenticationController.signInWithApple();
                    },
                    child: CustomWidget.customAssetImageWidget(
                        image: Assets.assetsApple, height: 6, width: 6),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      authenticationController.signInWithGoogle();
                    },
                    child: CustomWidget.customAssetImageWidget(
                        image: Assets.assetsGoogle, height: 6, width: 6),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.loginScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                        image: Assets.assetsEmail, height: 6, width: 6),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
