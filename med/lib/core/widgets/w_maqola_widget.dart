// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:med/assets/color.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:med/features/asosiy/domain/entities/entities.dart';
import 'package:med/features/asosiy/presentation/bloc/maqola_bloc.dart';

import '../../../../assets/icons.dart';

class NewItem extends StatelessWidget {
  final MaqolaEntities newEntity;
  final VoidCallback onTap;
  const NewItem({
    Key? key,
    required this.newEntity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        // right: 16,
        // left: 16,
      ),
      child: Container(
        // width: 50,height: 50,
        width: double.maxFinite,

        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 13,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(
            color: AppColor.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      newEntity.title,
                      style: getTextTheme(context).bodyLarge!.copyWith(
                            color: AppColor.siyohrang,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Gap(8),
                    Text(
                      newEntity.avtor,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Gap(6),
                    Text(
                      newEntity.export,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColor.grey,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.network(
                    newEntity.image,
                  ),
                ),
              ],
            ),
            const Gap(6),
            Container(
              width: double.maxFinite,
              color: AppColor.textFieldBorder,
              height: 1,
            ),
            const Gap(8),
            Text(
              maxLines: 3,
              newEntity.description,
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  timeFormat(
                    newEntity.data,
                  ),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: AppColor.grey,
                      ),
                ),
                const Spacer(),
                GestureDetector( 
                  onTap: onTap,
                  child: SvgPicture.asset(
                    newEntity.isSave ? AppIcons.saved : AppIcons.unSaved,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class NewEntity extends Equatable {
  final String title;
  final String image;
  final String doctorName;
  final String category;
  final String description;
  final bool isSaved;
  final DateTime createdAt;
  const NewEntity({
    required this.title,
    required this.doctorName,
    required this.image,
    required this.category,
    required this.description,
    required this.isSaved,
    required this.createdAt,
  });
  @override
  List<Object?> get props => [
        title,
        image,
        description,
        doctorName,
        category,
        description,
        isSaved,
        createdAt,
      ];
}
