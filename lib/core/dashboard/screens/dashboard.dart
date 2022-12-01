import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/app/presentations/extensions.dart';
import 'package:mobiledevtest/app/presentations/texts.dart';
import 'package:mobiledevtest/core/dashboard/widgets/indicator.dart';
import 'package:mobiledevtest/core/home/screens/home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  PageController controller = PageController();

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: controller,
          children: const [HomeScreen()],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Material(
          color: Colors.white,
          elevation: 0,
          child: BottomAppBar(
            notchMargin: 8,
            child: TabBar(
              onTap: (val) {
                setState(() {});
              },
              labelStyle: const TextStyle(fontSize: 10),
              labelColor: Theme.of(context).primaryColor,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              //indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Theme.of(context).primaryColor,
              controller: tabController,
              indicator: const CustomTabIndicator(),
              tabs: [
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("home".toSVG()),
                      SizedBox(
                        height: 2.h,
                      ),
                      NormalText(
                        text: "Home",
                        fontSize: 10,
                        textColor: tabController?.index == 0
                            ? XColors.textColor()
                            : const Color.fromRGBO(193, 189, 189, 1),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("account".toSVG()),
                      SizedBox(
                        height: 2.h,
                      ),
                      NormalText(
                        text: "Accounts",
                        fontSize: 10,
                        textColor: tabController?.index == 1
                            ? XColors.textColor()
                            : const Color.fromRGBO(193, 189, 189, 1),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("apps".toSVG()),
                      SizedBox(
                        height: 2.h,
                      ),
                      NormalText(
                        text: "Apps",
                        fontSize: 10,
                        textColor: tabController?.index == 2
                            ? XColors.textColor()
                            : const Color.fromRGBO(193, 189, 189, 1),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("settings".toSVG()),
                      SizedBox(
                        height: 2.h,
                      ),
                      NormalText(
                        text: "Setting",
                        fontSize: 10,
                        textColor: tabController?.index == 3
                            ? XColors.textColor()
                            : const Color.fromRGBO(193, 189, 189, 1),
                      )
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
}
