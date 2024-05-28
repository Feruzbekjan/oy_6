import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'package:med/core/functions/app_functions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
   const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String getMonthName(DateTime dateTime) {
    return _months[dateTime.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    String monthName = getMonthName(_focusedDay);

    return Scaffold(
      appBar: AppBar(
        title:  Text("Kalendar", style: getTextTheme(context).displaySmall!.copyWith(color: AppColor.siyohrang,),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                        _focusedDay.day,
                      );
                    });
                  },
                  child: SvgPicture.asset(
                    AppIcons.arrowBack,
                  ),
                ),
                Text(
                  monthName,
                  style: getTextTheme(context).displayMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.siyohrang,
                      ),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                          _focusedDay.day,
                        );
                      });
                    },
                    child: SvgPicture.asset(
                      AppIcons.arrowNext,
                    )),
              ],
            ),
          ),
          const Gap(16),
          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: getTextTheme(context).displaySmall!.copyWith(color: AppColor.greyText, ),
              weekendStyle: getTextTheme(context).displaySmall!.copyWith(color: AppColor.greyText, ),
            ),
            headerVisible: false,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(

              defaultTextStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 16),
              weekendTextStyle: const TextStyle(fontSize: 16, color: AppColor.blue),
              
              selectedTextStyle: getTextTheme(context).displaySmall!.copyWith(
                    fontSize: 16,
                  ),
              defaultDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.blue.withOpacity(0.7),
              ),
              selectedDecoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(4),
              ),
              weekendDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue.withOpacity(0.3),
              ),
            ),
            weekNumbersVisible: false,
            firstDay: DateTime.utc(2014, 1, 1),
            lastDay: DateTime.utc(2034, 1, 1),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
        ],
      ),
    );
  }
}
