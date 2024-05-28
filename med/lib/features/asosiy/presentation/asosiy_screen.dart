import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/core/auth_status/status.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:med/core/widgets/maqola.dart';
import 'package:med/core/widgets/w_maqola_widget.dart';
import 'package:med/features/asosiy/presentation/bloc/maqola_bloc.dart';

class AsosiyScreen extends StatefulWidget {
  const AsosiyScreen({super.key});

  @override
  State<AsosiyScreen> createState() => _AsosiyScreenState();
}

class _AsosiyScreenState extends State<AsosiyScreen> {
  @override
  void initState() {
    // print("object");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<MaqolaBloc, MaqolaState>(
          builder: (context, state) {
            if (state.statusMaqola == StatusMaqola.pure) {
              context.read<MaqolaBloc>().add(
                    MaqolaBlocStarted(),
                  );
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.statusMaqola == StatusMaqola.loading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.statusMaqola == StatusMaqola.failure) {
              return const Center(
                child: Text(
                  "Xatolik",
                ),
              );
            } else {
              return state.isSearching
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                        children: [
                          ...List.generate(state.data.length, (index) {
                            return NewItem(
                              newEntity: state.data[index],
                              onTap: () {
                                
                              },
                            );
                          })
                        ],
                      ),
                  )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView(
                        children: [
                          const Gap(20),
                          Text(
                            "Turkumlar",
                            style: getTextTheme(context).bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.siyohrang,
                                ),
                          ),
                          const Gap(12),
                          SizedBox(
                            height: 170,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...List.generate(
                                  3,
                                  (index) {
                                    final item = getTurkumlar(index);
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 160,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            blurStyle: BlurStyle.outer,
                                            color: AppColor.siyohrang
                                                .withOpacity(0.3),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColor.white,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(item.icon),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              item.label,
                                              style: getTextTheme(context)
                                                  .displaySmall!
                                                  .copyWith(
                                                    color: AppColor.siyohrang,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            alignment: Alignment.center,
                                            height: 28,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              border: Border.all(
                                                color: AppColor.blue,
                                                width: 1,
                                              ),
                                            ),
                                            child: Text(
                                              "Turkumga kirish",
                                              style: getTextTheme(context)
                                                  .displayLarge!
                                                  .copyWith(
                                                    color: AppColor.blue,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Gap(38),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "So’nggi maqolalar",
                                style:
                                    getTextTheme(context).bodySmall!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.siyohrang,
                                        ),
                              ),
                              Text(
                                "Barcha maqolalar",
                                style: getTextTheme(context)
                                    .displayLarge!
                                    .copyWith(
                                      color: AppColor.blue,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                          ...List.generate(
                            state.data.length,
                            (index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Maqola(
                                      entities: state.data[index],
                                    ),
                                  ),
                                );
                              },
                              child: NewItem(
                                onTap: () {
                                  context.read<MaqolaBloc>().add(
                                        SavedEvent(
                                          id: state.data[index].id,
                                          entities: state.data[index],
                                        ),
                                      );
                                },
                                newEntity: state.data[index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}
