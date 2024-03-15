import 'package:crafty_bay/presentation/state_holder/cart_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/carts/cart_product_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<CartListController>().getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
        title: const Text(
          'Carts',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 3,
      ),
      body: Column(
        children: [
          Expanded(
            child:
                GetBuilder<CartListController>(builder: (cartListController) {
              if (cartListController.inProgress == true) {
                return const CenterCircularProgressIndicator();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartListController
                              .cartListModel.cartItemList?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return const CartProductItem();
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
          totalPriceAndCheckOutSection,
        ],
      ),
    );
  }

  Container get totalPriceAndCheckOutSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: AppColors.primaryColor.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
              Text(
                "\$1202453",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Check out")),
        ],
      ),
    );
  }
}
