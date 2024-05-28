import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:med/features/asosiy/presentation/asosiy_screen.dart';
import 'package:med/features/asosiy/presentation/bloc/maqola_bloc.dart';
import 'package:med/features/authetification/presentation/bloc/auth_bloc.dart';
import 'package:med/features/calendar/presentation/calendar.dart';
import 'package:med/features/chat/presentation/page/chat_control.dart';
import 'package:med/features/maqolalar/presentation/maqola.dart';
import 'package:med/features/profile/presentation/pages/profile_first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(initialPage: 0);
  double page = 0;
  double a = 0;
  @override
  void initState() {
    controller.addListener(() {
      a = controller.page!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          automaticallyImplyLeading: false,
          actions: [
            SvgPicture.asset(AppIcons.logo),
            const Spacer(),
            SvgPicture.asset(AppIcons.notes),
            const Gap(16),
          ],
          bottom: PreferredSize(
            preferredSize: const Size(50, 100),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
              child: TextField(
                onEditingComplete: () {},
                onChanged: (value) {
                  context.read<MaqolaBloc>().add(
                        Searching(
                          query: value,
                        ),
                      );
                },
                style: getTextTheme(context).bodyLarge!.copyWith(
                      color: AppColor.siyohrang,
                      fontWeight: FontWeight.w400,
                    ),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.search,
                    ),
                  ),
                  hintText: "Ilmiy maqolalarni izlash",
                  hintStyle: getTextTheme(context).bodyLarge!.copyWith(
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                      ),
                  filled: true,
                  fillColor: AppColor.textFieldBorder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                    borderSide: const BorderSide(
                      color: AppColor.textFieldBorder,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            AsosiyScreen(),
            MaqolaScreen(),
            ChatScreen(),
            CalendarScreen(),
            ProfileFirstScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: BnbItem(controller: controller),
        ),
      ),
    );
  }
}

class BnbItem extends StatefulWidget {
  final PageController controller;
  const BnbItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<BnbItem> createState() => _BnbItemState();
}

class _BnbItemState extends State<BnbItem> {
  double page = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(5, (index) {
          final item = getNavigatorBar(index);
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalendarScreen(),
                  ),
                );
              } else if (index == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileFirstScreen(),
                  ),
                );
              } else {
                widget.controller.jumpToPage(index);
                page = widget.controller.page!;
                setState(() {});
              }
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  item.icon,
                  color: page == index ? AppColor.siyohrang : null,
                ),
                Text(
                  item.label,
                  style: getTextTheme(context).bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.greyText,
                      ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
