import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iparcompany/core/extensions/general_extension.dart';
import 'package:iparcompany/core/injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: GestureDetector(
              onTap: () async {
                context.pushReplacementNamed(context.route.welcome);
                final shared = sl<SharedPreferences>();
                await shared.setBool("wizard", true);
              },
              child: Text(
                "Skip",
                style: context.style.fontSize14Weight400.copyWith(
                  color: context.color.grey,
                ),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(context.images.rasm1),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Consult only with a doctor \nyou trust",
                    style: context.style.fontSize20Weight700,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(context.images.rasm2),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Find a lot of specialist \ndoctors in one place",
                    style: context.style.fontSize20Weight700,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(context.images.rasm3),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get connect our Online \nConsultation",
                    style: context.style.fontSize20Weight700,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  activeDotColor: context.color.green,
                  dotColor: context.color.green.withOpacity(0.3),
                ),
                onDotClicked: (index) {},
              ),
              GestureDetector(
                onTap: () async {
                  if (controller.page! < 2) {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
                  } else {
                    final shared = sl<SharedPreferences>();
                    context.pushReplacementNamed(context.route.welcome);
                    await shared.setBool("wizard", true);
                  }
                },
                child: Container(
                  height: (MediaQuery.of(context).size.width / 100) * 15,
                  width: (MediaQuery.of(context).size.width / 100) * 15,
                  decoration: BoxDecoration(
                    color: context.color.green,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(context.icons.nextPage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
