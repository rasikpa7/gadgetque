import 'package:flutter/material.dart';
import 'package:gadgetque/view/bottom_navigator/bottom_navigation.dart';
import 'package:gadgetque/view/core/color.dart';
import 'package:gadgetque/view/core/space.dart';
import 'package:gadgetque/view/screens/buy_product/screen_buy_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/widget/ratting_item.dart';
import 'package:get/get.dart';
class MostRattedItem extends StatelessWidget {
  const MostRattedItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.7,
      width: size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(onTap: () => Get.to(const BuyProduct()),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.45,
                    height: size.width * 0.4,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'asset/entry_background.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width * 0.45,
                    height: size.width * 0.3,
                    decoration: const BoxDecoration(
                      color: kBoxColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ItemText(
                              name: 'Headphone',
                              weight: FontWeight.w500,
                              fontSize: 18,
                              color: kGreyColor),
                          const ItemText(
                              name: 'Dell Alienware M15',
                              weight: FontWeight.bold,
                              fontSize: 20,
                              color: kBlackColor),
                          Row(
                            children: const [
                              ItemText(
                                  name: '€14,000',
                                  weight: FontWeight.normal,
                                  fontSize: 20,
                                  color: kredColor),
                              ItemText(
                                  strike: TextDecoration.lineThrough,
                                  name: '€16,000',
                                  weight: FontWeight.normal,
                                  fontSize: 17,
                                  color: kBlack54Color),
                            ],
                          ),
                          kHeigt5,
                          const RattingItems()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
