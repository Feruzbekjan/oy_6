import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:med/assets/color.dart';
import 'package:med/assets/icons.dart';
import 'chat_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> svgPaths = [
    AppIcons.psixolog,
    AppIcons.kardiolog,
    AppIcons.nerv,
  ];

  List<String> messages = [
    'Psixologiya',
    'Kardiologiya',
    'Nevrologiya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 106, // Adjusted height to accommodate button
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: SvgPicture.asset(
                          svgPaths[index],
                          width: 42,
                          height: 42,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Text(
                            messages[index],
                            style: const TextStyle(fontSize: 16, color: AppColor.siyohrang,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(4),
                  SizedBox(
                    width: double.infinity,
                    height: 28,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatPage1(
                                receiverUserEmail: 'Doctors chat',
                                receiverUserId: 'messages',
                              ),
                            ));
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                          color: AppColor.blue, // Border color
                          width: 1, // Border width
                        )),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Xabarlashuvga o’tish',
                        style: TextStyle(color: AppColor.blue),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
