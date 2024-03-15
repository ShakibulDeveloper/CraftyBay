import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/login_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_details_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int itemCounter = 1;

  List<Color> colors = [
    Colors.blueGrey,
    Colors.redAccent,
    Colors.blue,
    Colors.amber,
    Colors.black,
  ];
  Color? _selectedColor;

  List<String> size = [
    'S',
    'L',
    'M',
    'XL',
    'XXL',
    'XXXL',
  ];
  String? _selectedSize;

  cartIncrement() {
    itemCounter++;
    setState(() {});
  }

  cartDecrement() {
    if (itemCounter > 1) {
      itemCounter--;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 3,
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductDetailsCarousel(
                      urls: [
                        productDetailsController.productDetails.img1 ?? '',
                        productDetailsController.productDetails.img2 ?? '',
                        productDetailsController.productDetails.img3 ?? '',
                        productDetailsController.productDetails.img4 ?? '',
                      ],
                    ),
                    productDetailsBody(productDetailsController.productDetails),
                  ],
                ),
              ),
            ),
            totalPriceAndAddToCart,
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetailsData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  productDetailsData.product?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: cartDecrement,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(itemCounter.toString()),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      cartIncrement();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        color: AppColors.primaryColor,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Wrap(
                children: [
                  const Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.amber,
                  ),
                  Text(
                    productDetailsData.product?.star!.toStringAsFixed(1) ??
                        0.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              const Text(
                "Review",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 8),
              Card(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Colors",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          ColorSelector(
            colors: productDetailsData.color
                    ?.split(',')
                    .map((e) => getColorFromString(e))
                    .toList() ??
                [],
            onChange: (selectedColor) {
              _selectedColor = selectedColor;
            },
          ),
          const SizedBox(height: 16),
          const Text(
            "Size",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          SizeSelector(
            size: productDetailsData.size?.split(',') ?? [],
            onChange: (selectedSize) {
              _selectedSize = selectedSize;
            },
          ),
          const SizedBox(height: 16),
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            productDetailsData.des ?? '',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container get totalPriceAndAddToCart {
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
          GetBuilder<AddToCartController>(builder: (addToCartController) {
            return Visibility(
              visible: addToCartController.inProgress == false,
              replacement: const CenterCircularProgressIndicator(),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedSize != null && _selectedColor != null) {
                      if (AuthController().isTokenNotNull) {
                        String color = colorToString(_selectedColor!);
                        final response = await addToCartController.addToCart(
                            widget.productId, color, _selectedSize!);

                        if (response) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Well Done!',
                            message: 'Add to cart, successfully!',
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ));
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Failed!',
                            message: 'Add to cart, failed!',
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } else {
                        Get.to(const LoginScreen());
                      }
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                        title: 'Failed!',
                        message: 'Please check size and color.',
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text("Add To Cart")),
            );
          }),
        ],
      ),
    );
  }

  Color getColorFromString(String color) {
    String colorName = color.toLowerCase();
    if (colorName == "red") {
      return Colors.red;
    } else if (colorName == "green") {
      return Colors.green;
    } else if (colorName == 'white') {
      return Colors.white;
    } else {
      return Colors.grey;
    }
  }

  String colorToString(Color colorCode) {
    if (colorCode == Colors.red) {
      return "Red";
    } else if (colorCode == Colors.green) {
      return "Green";
    } else if (colorCode == Colors.white) {
      return "White";
    } else {
      return "Grey";
    }
  }

  // Color getColorFromString(String colorCode) {
  //   String code = colorCode.replaceAll("#", '');
  //   String hexCode = 'FF$code';
  //   return Color(int.parse('0x$hexCode'));
  // }
  //
  // String colorToHashColorCode(String colorCode) {
  //   return colorCode
  //       .toString()
  //       .replaceAll("0xff", "#")
  //       .replaceAll("Color(", '')
  //       .replaceAll(")", '');
  // }
}
