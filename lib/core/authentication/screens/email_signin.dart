// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobiledevtest/app/logic/resource.dart';
import 'package:mobiledevtest/app/presentations/button.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/inputfield.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';
import 'package:mobiledevtest/core/authentication/screens/phonenumber_signin.dart';
import 'package:mobiledevtest/core/authentication/view%20model/auth_viewmodel.dart';
import 'package:mobiledevtest/core/dashboard/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:loader_overlay/loader_overlay.dart';

class EmailSigninScreen extends StatefulWidget {
  const EmailSigninScreen({super.key});

  @override
  State<EmailSigninScreen> createState() => _EmailSigninScreenState();
}

class _EmailSigninScreenState extends State<EmailSigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? remember = false;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                NormalText(
                  text: "Welcome Back!",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: XColors.textColor(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                NormalText(
                  text: "Michael",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  textColor: XColors.textColor(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const NormalText(
                  text: "Email",
                  textColor: Color(0xFF636363),
                  fontSize: 14,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: 350.w,
                  child: XTextField(
                    controller: emailController,
                    hintText: "Email",
                    textSize: 14.sp,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Input an email";
                      }
                      return null;
                    },
                    fillColor: const Color.fromRGBO(248, 248, 248, 1),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const NormalText(
                  text: "Password",
                  textColor: Color(0xFF636363),
                  fontSize: 14,
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: 350.w,
                  child: XTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                    textSize: 14.sp,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "Input a password";
                      }
                      return null;
                    },
                    fillColor: const Color.fromRGBO(248, 248, 248, 1),
                    suffixIcon: const InkWell(
                        child: Icon(
                      Icons.remove_red_eye,
                      color: Color.fromRGBO(160, 160, 160, 1),
                      size: 18,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color.fromRGBO(217, 217, 217, 1)),
                            height: 14.h,
                            width: 16.w,
                            child: Checkbox(
                                value: remember,
                                activeColor: XColors.mainColor(),
                                onChanged: (val) {
                                  remember = val;
                                  setState(() {});
                                },
                                side: const BorderSide(
                                  color: Colors.transparent,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          NormalText(
                            text: "Remember Login",
                            fontSize: 14,
                            textColor: XColors.textColor(),
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      NormalText(
                        text: "Forgot Password?",
                        fontSize: 14,
                        textColor: XColors.textColor(),
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.w,
                ),
                XButton(
                  buttonName: "Log In",
                  fontSize: 18.sp,
                  mHeight: 35.h,
                  mWidth: 200.w,
                  action: () {
                    if (key.currentState!.validate()) {
                      signIn();
                    }
                  },
                  buttonRadius: 8.r,
                  buttonColor: XColors.mainColor(),
                  textColor: Colors.white,
                ),
                SizedBox(
                  height: 20.w,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                                color: XColors.textColor(),
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                    color: XColors.mainColor(),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 50.w,
                      ),
                      NormalText(
                        text: "-or log in with-",
                        textColor: XColors.textColor(),
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PhonenumberSigninScreen()));
                        },
                        child: Container(
                          width: 140.w,
                          height: 40.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: XColors.mainColor())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("phone".toPNG()),
                              const NormalText(
                                text: "Phone Number",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signIn() async {
    AuthViewmodel viewmodel = context.read<AuthViewmodel>();

    context.loaderOverlay.show();

    Map<String, dynamic> data = {
      "username": emailController.text,
      "password": passwordController.text,
      "deviceIdentifier": "dev-from-mobile",
      "registerAsNewDevice": false,
      "otp": "",
      "channel": "mobile"
    };

    await viewmodel.signIn(data);

    if (viewmodel.signInResource.ops == NetworkStatus.SUCCESSFUL) {
      context.loaderOverlay.hide();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DashboardScreen()));
    } else {
      context.loaderOverlay.hide();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: NormalText(
              textColor: Colors.white,
              fontSize: 11,
              text: viewmodel.signInResource.networkError ??
                  "Something went wrong")));
    }
  }
}
