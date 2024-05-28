import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/core/route_names/app_route_names.dart';
import 'package:med/core/widgets/first_page.dart';
import 'package:med/core/widgets/second_page.dart';
import 'package:med/core/widgets/three_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController controller;
  double page = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          children: [
            Stack(
              children: [
                const FirstPage(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Mutaxasislardan maslahat",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.textBlue,
                            ),
                      ),
                      const Gap(20),
                      Text(
                        "Find a doctor who will take the best\n                care of your health...",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.darkBlue,
                            ),
                      ),
                      Gap(MediaQuery.of(context).size.height / 5.5)
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                const SecondPage(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        """
 Rejalashtirilgan 
davolanish tartibi""",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.darkBlue,
                            ),
                      ),
                      Text(
                        """
Set up a reminder to take the 
          medicine on time...
                        """,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.darkBlue,
                            ),
                      ),
                      Gap(MediaQuery.of(context).size.height / 10),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                const ThreePage(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Order Medicine Online",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.darkPink,
                            ),
                      ),
                      const Gap(20),
                      Text(
                        """
Order your medicine that your 
        doctor provided you...""",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.darkBlue,
                            ),
                      ),
                      Gap(MediaQuery.of(context).size.height / 6)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: GestureDetector(
            onTap: () async{
              if (page != 1) {
                page = controller.page!;
                controller.nextPage(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.linear,
                );
                setState(() {});
              } else {
                 final shared = await SharedPreferences.getInstance();
      await shared.setBool(
        "wizard",
        true,
      );
                Navigator.pushNamed(
                  context,
                  AppRouteNames.login,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 42,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                getText(page),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColor.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 String getText(double value)  {
    if (value == 1.0) {
     

      return "Asosiyga o'tish";
    }
    return "Davom etish";
  }
}
