import 'package:flutter/material.dart';
import 'package:gadgetque/controller/cart_controller.dart';
import 'package:gadgetque/model/category_datas_model.dart';
import 'package:gadgetque/view/constant/core/space.dart';
import 'package:gadgetque/view/screens/cart_page/screen_cart.dart';
import 'package:gadgetque/view/screens/checkout_page/screen_order_summary.dart';
import 'package:gadgetque/view/screens/product_view_page/category/widget/image_details.dart';
import 'package:gadgetque/view/screens/product_view_page/category/widget/product_image.dart';
import 'package:gadgetque/view/screens/product_view_page/widget/similar_item.dart';
import 'package:gadgetque/view/screens/widget/bottom_double_button.dart';
import 'package:gadgetque/view/screens/widget/divider.dart';
import 'package:gadgetque/view/screens/widget/main_headding.dart';
import 'package:gadgetque/view/screens/widget/second_appbar.dart';
import 'package:get/get.dart';

class BuyCategoryProduct extends StatelessWidget {
  final Prodatum products;
  const BuyCategoryProduct({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SecondAppbar(
          title: products.category,
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ListView(
              children: [
                CatProductImage(products: products),
                // kHeigt30,
                MainHead(headding: products.name, top: 20),
                const DivLine(),
                CatImageDetails(products: products),
                const MainHead(
                  headding: 'You May Also Like',
                ),
                const DivLine(),
                const SimilarItem(),
                kHeigt50,
              ],
            ),
            GetBuilder<CartController>(
              init: CartController(),
              builder: (controller) => BottomDoubleButton(
                secondText: 'Buy Now',
                firstText: controller.isAdd.value ? 'Add to Cart' : 'View Cart',
                firstOnTap: () {
                  controller.isAdd.value
                      ? controller.addCartItems(products.id)
                      : Get.to(ScreenCart());
                },
                secondOnTap: () {
                  Get.to(ScreenSummary());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}