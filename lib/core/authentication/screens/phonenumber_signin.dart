import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobiledevtest/app/presentations/button.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/inputfield.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';
import 'package:mobiledevtest/core/dashboard/screens/dashboard.dart';

class PhonenumberSigninScreen extends StatefulWidget {
  const PhonenumberSigninScreen({super.key});

  @override
  State<PhonenumberSigninScreen> createState() =>
      _PhonenumberSigninScreenState();
}

class _PhonenumberSigninScreenState extends State<PhonenumberSigninScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
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
                text: "Phone Number",
                textColor: Color(0xFF636363),
                fontSize: 14,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(233, 233, 233, 1)),
                    height: 45.h,
                    width: 90.w,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: Color.fromRGBO(14, 14, 14, 1),
                            ),
                            items: [
                              DropdownMenuItem(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    "flag".toPNG(),
                                    scale: 6,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  NormalText(
                                    text: "+234",
                                    fontSize: 14.sp,
                                  ),
                                ],
                              ))
                            ],
                            onChanged: (val) {})),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 220.w,
                    child: XTextField(
                      controller: phoneController,
                      hintText: "Phone Number",
                      textSize: 14.sp,
                      suffixIcon: const Icon(
                        Icons.cancel_outlined,
                        size: 15,
                        color: Color.fromRGBO(66, 86, 97, 1),
                      ),
                      fillColor: const Color.fromRGBO(248, 248, 248, 1),
                    ),
                  ),
                ],
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DashboardScreen()));
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100.w,
                        height: 40.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: XColors.mainColor())),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "email".toPNG(),
                              scale: 4,
                            ),
                            const NormalText(
                              text: "Email",
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
    );
  }
}
