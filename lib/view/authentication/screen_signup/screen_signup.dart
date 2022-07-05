import 'package:flutter/material.dart';
import 'package:gadgetque/view/authentication/screen_entry/screen_entry.dart';
import 'package:gadgetque/view/authentication/screen_signin/screen_signin.dart';
import 'package:gadgetque/view/authentication/widget/action_button.dart';
import 'package:gadgetque/view/authentication/widget/app_bar.dart';
import 'package:gadgetque/view/authentication/widget/background_image.dart';
import 'package:gadgetque/view/authentication/widget/switch_bottom_textbutton.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/widget/form_field.dart';

import 'package:get/get.dart';
class ScreenSignup extends StatelessWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImage(image: 'asset/admin_background.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EntryAppbar(
                      iconColor: kGreyColor, textColor: kWhiteColor),
                  kHeigt80,
                  const Text(
                    'Hey ,\nSign Up Now.',
                    style: TextStyle(color: kWhiteColor, fontSize: 28),
                  ),
                  kHeigt100,
                  FormFields(
                      name: 'Name',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      name: 'Mobile',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      name: 'Email',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      name: 'Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  FormFields(
                      name: 'Confirm Password',
                      color: kFormColor,
                      inputTextColor: kWhiteColor),
                  kHeigt5,
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: EntryButton(
                        color: kFormColor,
                        height: size.width * 0.12,
                        // size: size,
                        onTap: () {
                          Get.to(BottomNavigator());
                        },
                        buttonName: 'Submit',
                        width: size.width * 0.836),
                  ),
                  kHeigt80,
                  SwitchBottomTextButton(onTap: () {
                    Get.to(ScreenSignin());
                  }, text: 'Signin')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}