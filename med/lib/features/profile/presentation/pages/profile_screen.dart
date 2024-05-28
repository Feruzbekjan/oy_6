import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/widgets/w_button.dart';
import 'package:med/core/widgets/w_textfield.dart';
import 'package:med/features/profile/domain/entity/entity.dart';
import 'package:med/features/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:med/features/profile/presentation/widgets/select_data_time.dart';

class ProfileEditingScreen extends StatefulWidget {
  final ProfileEntity user;
  const ProfileEditingScreen({super.key, required this.user});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  TextEditingController fish = TextEditingController();
  TextEditingController qiziqishlar = TextEditingController();
  TextEditingController boyUzunligi = TextEditingController();
  TextEditingController vazn = TextEditingController();
  TextEditingController allergia = TextEditingController();
  TextEditingController hudud = TextEditingController();
  DateTime sana = DateTime(2017, 12, 10);

  List<String> viloyatlar = [
    'Andijon',
    'Buxoro',
    'Farg\'ona',
    'Jizzax',
    'Xorazm',
    'Namangan',
    'Navoiy',
    'Qashqadaryo',
    'Qoraqalpog\'iston',
    'Samarqand',
    'Sirdaryo',
    'Surxondaryo',
    'Toshkent',
    'Toshkent Viloyati',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        toolbarHeight: 57,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(AppIcons.back),
          ),
        ),
        title: const Text(
          "Profil ma’lumotlari",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: AppColor.siyohrang),
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.status) {
            case MainStatus.pure:
              context.read<ProfileBloc>().add(
                    EditingScreenDateChange(
                      user: widget.user,
                    ),
                  );
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
            case MainStatus.success:
              fish.text = state.user.fish;
              qiziqishlar.text = state.user.qiziqishlar;
              boyUzunligi.text = state.user.boyUzunligi.toString();
              vazn.text = state.user.vazn.toString();
              allergia.text = state.user.allergia;
              hudud.text = state.user.hudud;
              sana = state.user.tugulganKun;
              print("Keldiiiiiiiiiiiiiiiiiiiiii ${state.user}");
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          context.read<ProfileBloc>().add(EditImage());
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: state.avatar != ""
                                ? Image.file(
                                    File(state.avatar),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 25,
                                  ),
                          ),
                          Icon(
                            Icons.edit_square,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ]),
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      "F.I.Sh.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.siyohrang,
                      ),
                    ),
                    const Gap(8),
                    WTextField(
                      borderRadius: 8,
                      controller: fish,
                      hintText: "Familia va Ismni kiriting...",
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyText,
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      "Qiziqishlar",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.siyohrang,
                      ),
                    ),
                    const Gap(8),
                    WTextField(
                      borderRadius: 8,
                      controller: qiziqishlar,
                      hintText: "Hobbilaringizni kiriting....",
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyText,
                      ),
                    ),
                    const Gap(16),
                    const Row(
                      children: [
                        Text(
                          "Hudud",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.greyText,
                          ),
                        ),
                        Text(
                          " (ixtiyoriy)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.siyohrang,
                          ),
                        )
                      ],
                    ),
                    const Gap(8),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.blue.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: ExpansionTile(
                        initiallyExpanded: false,
                        backgroundColor: Colors.white,
                        title: Text(
                          hudud.text != "" ? hudud.text : "Hududni tanlang",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.siyohrang,
                          ),
                        ),
                        children: List.generate(
                          viloyatlar.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  hudud.text = viloyatlar[index];
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                  width: 0.5,
                                  color: AppColor.greyText,
                                ))),
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  viloyatlar[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.siyohrang,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      "Bo’y uzunligi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.siyohrang,
                      ),
                    ),
                    const Gap(8),
                    WTextField(
                      borderRadius: 8,
                      controller: boyUzunligi,
                      hintText: "Bo’y uzunligini kiriting",
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyText,
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      "Vazn og’irligi",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.siyohrang, ),
                    ),
                    const Gap(16),
                    WTextField(
                      borderRadius: 8,
                      controller: vazn,
                      hintText: "Vazningizni kiriting",
                      hintTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyText,),
                    ),
                    const Gap(16),
                    const Text(
                      "Tug‘ilgan sana",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.siyohrang),
                    ),
                    const Gap(8),
                    GestureDetector(
                      onTap: () async {
                        sana =
                            await selectTime(context) ?? DateTime(2024, 01, 01);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: double.maxFinite,
                        height: 44,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "KK/OO/YYYY",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyText,),
                            ),
                            SvgPicture.asset(AppIcons.check,),
                          ],
                        ),
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      "Allergiya (ixtiyoriy)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.siyohrang,
                      ),
                    ),
                    const Gap(8),
                    WTextField(
                      borderRadius: 8,
                      controller: allergia,
                      hintText: "Nimalarga allergiyangiz bor?",
                      hintTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.greyText,
                      ),
                      minLines: 4,
                      maxlines: 5,
                    ),
                    const Gap(190),
                    WButton(
                      borderRadius: 4,
                      height: 42,
                      onTap: () {
                        context.read<ProfileBloc>().add(
                              EditingUser(
                                user: ProfileEntity(
                                  imgUrl: state.avatar,
                                  fish: fish.text,
                                  qiziqishlar: qiziqishlar.text,
                                  hudud: hudud.text,
                                  boyUzunligi: int.parse(boyUzunligi.text == ""
                                      ? "0"
                                      : boyUzunligi.text),
                                  vazn: double.parse(
                                      vazn.text == "" ? "0" : vazn.text),
                                  tugulganKun: sana,
                                  allergia: allergia.text,
                                ),
                                success: () {
                                  Navigator.pop(context);
                                  context.read<ProfileBloc>().add(
                                        GetUsersData(),
                                      );
                                },
                              ),
                            );
                      },
                      child: const Text(
                        "Saqlash",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
