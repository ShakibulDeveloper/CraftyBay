import 'package:crafty_bay/presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holder/category_item_controller.dart';
import 'package:crafty_bay/presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holder/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/state_holder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/read_profile_data_controller.dart';
import 'package:crafty_bay/presentation/state_holder/send_otp_to_email_controller.dart';
import 'package:crafty_bay/presentation/state_holder/special_product_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendOtpToEmailController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryItemController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(ProductListController());
  }
}
