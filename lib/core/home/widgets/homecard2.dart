import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';

class HomeCardTwo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color color;
  final Color subColor;
  const HomeCardTwo(
      {super.key,
      required this.color,
      required this.subColor,
      required this.image,
      required this.subtitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Image.asset(
                  image.toPNG(),
                  scale: 5,
                ),
                SizedBox(
                  width: 3.w,
                ),
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: title,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        textColor: XColors.textColor(),
                      ),
                      SizedBox(
                        width: 185.w,
                        child: NormalText(
                          text: subtitle,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          textColor: XColors.textColor(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 10.h,
            decoration: BoxDecoration(
                color: subColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
        ),
      ],
    );
  }
}
