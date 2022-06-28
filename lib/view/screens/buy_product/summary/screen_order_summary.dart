import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/radius.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/entry_pages/widget/form_field.dart';
import 'package:gadgetque/view/screens/buy_product/summary/widget/coupon_apply.dart';
import 'package:gadgetque/view/screens/buy_product/summary/widget/delivery_item.dart';
import 'package:gadgetque/view/screens/buy_product/summary/widget/delivery_to.dart';
import 'package:gadgetque/view/screens/buy_product/summary/widget/payment_method.dart';
import 'package:gadgetque/view/screens/widget/action_button.dart';
import 'package:gadgetque/view/screens/widget/bottom_double_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:gadgetque/view/screens/widget/two_text_elements_in_row.dart';

class ScreenSummary extends StatelessWidget {
  const ScreenSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(size.width * .53);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SecondAppbar(
          title: 'Order Summary',
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: [
                  DeliveryTo(),
                  kHeigt10,
                  DeliveryItem(),
                  kHeigt10,
                  CouponApply(),
                  kHeigt10,
                  PaymentMethod(),
                  kHeigt10,
                  Container(
                    decoration: BoxDecoration(
                        color: kBoxColor, borderRadius: kRAdius10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:const [
                          ItemText(
                              name: 'Price Details',
                              weight: FontWeight.bold,
                              fontSize: 22,
                              color: kBlackColor),
                          kHeigt5,
                          DivLine(),kHeigt5,
                          TextElementsInRow(
                              firstText: 'Price                           :',
                              secondText: '€30,060',
                              wieght: FontWeight.w500,
                              fontSize: 18,
                              fontColor: kBlack54Color),
                          kHeigt5,
                          TextElementsInRow(
                              firstText: 'Delivery Charge        :',
                              secondText: '€60',
                              wieght: FontWeight.w500,
                              fontSize: 18,
                              fontColor: kBlack54Color),kHeigt5,
                          DivLine(),
                          kHeigt10,
                          TextElementsInRow(
                              firstText: 'Amount Payable   :',
                              secondText: '€30,060',
                              wieght: FontWeight.w500,
                              fontSize: 20,
                              fontColor: kBlackColor),
                        ],
                      ),
                    ),
                  ),
                  kHeigt10,
                  kHeigt50
                ],
              ),
            ),
            BottomDoubleButton(
                secondText: 'Continue',
                firstText: 'Cancel Order',
                firstOnTap: () {},
                secondOnTap: () {})
          ],
        ),
      ),
    );
  }
}
