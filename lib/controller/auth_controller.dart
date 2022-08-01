import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:gadgetque/model/signin_model.dart';
import 'package:gadgetque/model/signup_model.dart';
import 'package:gadgetque/services/auth_services.dart';
import 'package:gadgetque/view/constant/authentication/screen_signin/screen_signin.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;
  //>>>signin user<<<//
  signinUser(String mail, String password) async {
    isLoading(true);
    Map<String, dynamic> signinData = {
      "Email": mail,
      "Password": password,
    };

    try {
      final response = await AuthServices().checkLogin(signinData);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = signinModelFromJson(response.data);

        Get.offAll(
          BottomNavigator(),
        );
        Get.snackbar(
          'hey, ${data.response.user.name}',
          'discover your unique style',
          colorText: kGreenColor,
          snackPosition: SnackPosition.BOTTOM,
          padding: const EdgeInsets.all(20),
        );
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString(loggedKey, data.response.user.id);
        sharedPref.get(loggedKey);
      } else {
        Get.snackbar(
          'Login Error',
          'entered mail or password is incorrect',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Login Error',
        'entered mail or password is incorrect',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    } finally {
      isLoading(false);
    }
  }

//>>>signup user<<<//
  signupUser(String name, String mobile, String mail, String password,
      String confirmPassword) async {
    isLoading(true);
    Map<String, dynamic> signupData = {
      "Name": name,
      "Mobile": mobile,
      "Emailaddress": mail,
      "Password": password,
      "confirmPass": confirmPassword,
    };
    try {
      final response = await AuthServices().checkSignin(signupData);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final data = signupModelFromJson(response.data);
        log(data.response.toString());
        if (data.response.acknowledged) {
          Get.snackbar(
            'successfully creatted',
            'discover your own style',
            colorText: kGreenColor,
            snackPosition: SnackPosition.BOTTOM,
            padding: const EdgeInsets.all(20),
          );
          Get.offAll(ScreenSignin());
        } else {
          Get.snackbar(
            'Error',
            'entered mail or mobile is already there',
            snackPosition: SnackPosition.BOTTOM,
            colorText: kredColor,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Signup Error',
        'entered mail or mobile is already there',
        snackPosition: SnackPosition.BOTTOM,
        colorText: kredColor,
      );
    } finally {
      isLoading(false);
    }
  }

//>>>signout user<<<//
  signoutUser() async {
    try {
      final response = await AuthServices().checkSignout();
      if (response != null) {
        Get.snackbar(
          'signout successfully',
          'please visit once again',
          snackPosition: SnackPosition.BOTTOM,
          colorText: kredColor,
        );
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.clear();
        Get.offAll(ScreenSignin());
      }
    } catch (e) {
      rethrow;
    }
  }
}
