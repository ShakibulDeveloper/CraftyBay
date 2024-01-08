import 'dart:async';

import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpTimer = const Duration(seconds: 1);
  int otpCount = 120;

  void otpCountDown() {
    Timer.periodic(otpTimer, (timer) {
      if (otpCount == 0) {
        timer.cancel();
      }
      otpCount--;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    otpCountDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 120),
                const Logo(width: 85),
                const SizedBox(height: 16),
                Text(
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "A 4 Digit OTP Code has been Sent",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor,
                    selectedFillColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const OtpScreen());
                    },
                    child: const Text("Next"),
                  ),
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: otpCount > 0,
                  replacement: Text(
                    "OTP Validation Expired!",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.red,
                        ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "This code will expire in ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "${otpCount}s",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: () {},
                  child: const Text("Resend Code"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
