import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/screens/my_order_page/screen_view_order.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/ratting_item.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .73,
      width: size.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(
                  const ScreenViewOrder(),
                ),
                child: Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 1 / 2,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Get.defaultDialog(
                              backgroundColor: kBoxColor,
                              buttonColor: kButtonColor,
                              middleText: 'Do you Want to Remove',
                              onConfirm: () {},
                              title: 'Are You Sure',
                              onCancel: () {});
                        },
                        backgroundColor: kredColor,
                        foregroundColor: kWhiteColor,
                        icon: Icons.delete,
                        label: 'Cancel Order',
                      ),
                    ],
                  ),
                  child: Card(
                    shadowColor: kGreyColor,
                    // color: kBoxColor,
                    shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.width * .31,
                            width: size.width * .31,
                            decoration: BoxDecoration(
                              borderRadius: kRAdius10,
                              color: kWhiteColor,
                              image: const DecorationImage(
                                image: AssetImage(
                                  'asset/mobile.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              ItemText(
                                  name: 'Deliver On Jan 09',
                                  weight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kBlackColor),
                              ItemText(
                                  name: 'Smart Watch',
                                  weight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kBlack54Color),
                              RattingItems(size: 24),
                              ItemText(
                                  name: 'Rate this Product Now',
                                  weight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kBlack54Color),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          itemCount: 10),
    );
  }
}
