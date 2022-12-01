import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';
import 'package:mobiledevtest/core/home/widgets/homecard.dart';
import 'package:mobiledevtest/core/home/widgets/homecard2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage: AssetImage("avatar".toPNG()),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: "Welcome",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            textColor: XColors.textColor(),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          NormalText(
                            text: "Michael Ajayi",
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            textColor: XColors.textColor(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 30.h,
                      width: 30.w,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(166, 166, 166, 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("notification".toSVG()))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              const HomeCard(
                  title: "Checkings Account",
                  amount: "\$25,000.00",
                  color: Color(0xFFCCEEDE)),
              SizedBox(
                height: 10.h,
              ),
              const HomeCard(
                  title: "Business Account",
                  amount: "\$5,000.00",
                  color: Color(0xFFFBE5D8)),
              SizedBox(
                height: 20.h,
              ),
              const HomeCardTwo(
                  color: Color.fromRGBO(226, 243, 252, 1),
                  subColor: Color.fromRGBO(230, 239, 245, 1),
                  image: "bonus",
                  title: "Get \$5 plus 10% of the fee for 365 days ",
                  subtitle:
                      "Refer a friend and get \$5 when they make their first dollars to naira exchange of \$500 and above, plus 10% of the fee everytime they make exchange for 365 days."),
              SizedBox(
                height: 10.h,
              ),
              const HomeCardTwo(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  subColor: Color.fromRGBO(251, 251, 251, 1),
                  image: "currency_exchange",
                  title: "Currency Exchange",
                  subtitle: "View penidng and completed exchange request")
            ],
          ),
        ),
      ),
    );
  }
}
