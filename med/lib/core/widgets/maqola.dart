// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/functions/app_functions.dart';

import 'package:med/features/asosiy/domain/entities/entities.dart';

class Maqola extends StatefulWidget {
  final MaqolaEntities entities;
  const Maqola({
    Key? key,
    required this.entities,
  }) : super(key: key);

  @override
  State<Maqola> createState() => _MaqolaState();
}

class _MaqolaState extends State<Maqola> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: GestureDetector( 
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(AppIcons.back),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            floating: false,
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              title: Row(
                children: [
                  Text(
                    widget.entities.title,
                    style: getTextTheme(context).bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.siyohrang,
                        ),
                  ),
                ],
              ),
              background: Image.network(
                widget.entities.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              
              [
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "${widget.entities.export}/${timeFormat(widget.entities.data)}",
                    style: getTextTheme(context).displayLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.greyText,
                        ),
                  ),
                ),
                const Gap(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.entities.description,
                    style: getTextTheme(context).displaySmall!.copyWith(
                          color: AppColor.siyohrang,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
