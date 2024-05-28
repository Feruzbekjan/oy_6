import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/route_names/app_route_names.dart';
import 'package:med/features/authetification/presentation/bloc/auth_bloc.dart';
import 'package:med/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:med/features/profile/presentation/pages/profile_screen.dart';

class ProfileFirstScreen extends StatefulWidget {
  const ProfileFirstScreen({super.key});

  @override
  State<ProfileFirstScreen> createState() => _ProfileFirstScreenState();
}

class _ProfileFirstScreenState extends State<ProfileFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 57,
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.siyohrang,
          ),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case MainStatus.pure:
              context.read<ProfileBloc>().add(GetUsersData());
              return const SizedBox();
            case MainStatus.loading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case MainStatus.failure:
              print(state.user);
              return const Center(
                child: Text(
                  "Xatolik chiqdi",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              );
            default:
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ProfileEditingScreen(
                                user: state.user,
                              ),
                            ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        height: 73,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 6,
                                  spreadRadius: 0.1,
                                  blurStyle: BlurStyle.normal,
                                  offset: Offset(2, 1)),
                            ]),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColor.siyohrang,
                                shape: BoxShape.circle,
                              ),
                              width: 49,
                              height: 49,
                            ),
                            const Gap(8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.user.fish,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.siyohrang,
                                  ),
                                ),
                                const Text(
                                  "+998 99 123 45 67",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.greyishText,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppIcons.arrow),
                            const Gap(8),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 14,
                          ),
                          width: MediaQuery.sizeOf(context).width / 100 * 42,
                          height: 56,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6,
                                    spreadRadius: 0.1,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(2, 1)),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppIcons.about,
                              ),
                              const Gap(12),
                              const Text(
                                "MedG haqida",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.siyohrang),
                              )
                            ],
                          ),
                        ),
                        const Gap(28),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 14),
                          width: MediaQuery.sizeOf(context).width / 100 * 42,
                          height: 56,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6,
                                    spreadRadius: 0.1,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(2, 1)),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.helping),
                              const Gap(12),
                              const Text(
                                maxLines: 2,
                                "Qo’llab- \n quvvatlash",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.siyohrang),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(26),
                    GestureDetector(
                      onTap: () {
                         context.read<AuthBloc>().add(LogOutEvent());
                         Navigator.pushNamedAndRemoveUntil(context, AppRouteNames.login, (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 16),
                        height: 56,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 6,
                                spreadRadius: 0.1,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(
                                  2,
                                  1,
                                ),
                              ),
                            ]),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.logout,
                            ),
                            const Gap(8),
                            const Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.red,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(AppIcons.arrow),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
