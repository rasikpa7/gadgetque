import 'package:flutter/material.dart';
import 'package:gadgetque/controller/home_controller.dart';
import 'package:gadgetque/view/constant/authentication/splash/splash.dart';
import 'package:gadgetque/view/constant/core/color.dart';
import 'package:gadgetque/view/constant/core/radius.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/product_view_page/screen_product.dart';
import 'package:gadgetque/view/screens/widget/item_text.dart';
import 'package:gadgetque/view/screens/wishlist_page/widget/add_wishlists.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => controller.categoryItems == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: controller.categoryItems!.length,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1.75,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(BuyProduct(
                    products: controller.products![index],
                  )),
                  child: Card(
                    color: kWhiteColor,
                    shape: RoundedRectangleBorder(borderRadius: kRAdius10),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              FadeInImage.assetNetwork(
                                  fit: BoxFit.fill,
                                  width: size.width * .5,
                                  height: size.width * .45,
                                  placeholder: 'asset/noimage.jpeg',
                                  image:
                                      'http://10.0.2.2:3000/product-image/${controller.categoryItems![index].id}/${controller.categoryItems![index].imageId}_1.jpg'),
                              const AddWishlist(radius: 20, iconSize: 34),
                            ],
                          ),
                          kHeigt5,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ItemText(
                                  name: controller.categoryItems![index].name
                                      .toUpperCase(),
                                  weight: FontWeight.bold,
                                  fontSize: 18,
                                  color: kBlackColor),
                              SizedBox(
                                child: ItemText(
                                    lines: 2,
                                    name: controller
                                        .categoryItems![index].description,
                                    weight: FontWeight.w400,
                                    fontSize: 16,
                                    color: kBlack54Color),
                              ),
                              ItemText(
                                  name:
                                      controller.categoryItems![index].category,
                                  weight: FontWeight.w500,
                                  fontSize: 20,
                                  color: kBlackColor),
                              Row(
                                children: [
                                  ItemText(
                                      name: controller
                                          .categoryItems![index].price,
                                      weight: FontWeight.bold,
                                      fontSize: 22,
                                      color: kGreenColor),
                                  kWidth5,
                                  ItemText(
                                      name: controller
                                          .categoryItems![index].originalPrice,
                                      weight: FontWeight.w400,
                                      fontSize: 20,
                                      strike: TextDecoration.lineThrough,
                                      color: kBlack54Color),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}