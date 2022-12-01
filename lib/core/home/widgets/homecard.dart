import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;
  const HomeCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        width: 300.w,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 50.h,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalText(
                        text: title,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        textColor: XColors.textColor(),
                      ),
                      NormalText(
                        text: amount,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        textColor: XColors.textColor(),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: NormalText(
                    text: "Welcome, let’s get you started",
                    textColor: XColors.textColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("virtual_card".toSVG()),
                      SizedBox(
                        width: 10.w,
                      ),
                      NormalText(
                        text: "View Virtual Card",
                        textColor: XColors.textColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              const Divider(),
              SizedBox(
                height: 2.5.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset("direct_deposit".toSVG()),
                      SizedBox(
                        width: 10.w,
                      ),
                      NormalText(
                        text: "Set up direct deposit",
                        textColor: XColors.textColor(),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
