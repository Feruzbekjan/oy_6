import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/features/profile/presentation/widgets/model_widget.dart';

Future<DateTime?> selectTime(BuildContext context) async {
  DateTime callingDate = DateTime.now();
  await showCupertinoModalPopup(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext builderContext) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(24),
          ),
        ),
        height: 378,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Bekor qilish",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.greyText,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Tasdiqlash",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.blue,
                    ),
                  ),
                )
              ],
            ),
            const Gap(16),
            Expanded(
              child: CupertinoDatePicker(
                itemExtent: 50,
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: callingDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  callingDate = newDateTime;
                },
                use24hFormat: false,
                minuteInterval: 1,
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: LineDivider(
                height: 1,
                width: 74,
              ),
            ),
          ],
        ),
      );
    },
  );
  return callingDate;
}
