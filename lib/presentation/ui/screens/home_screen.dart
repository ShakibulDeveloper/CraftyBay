import 'package:crafty_bay/presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circular_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              searchTextField,
              const SizedBox(height: 16),
              const BannerCarousel(),
              const SizedBox(height: 16),
              SectionTitle(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: 'Popular',
                onTap: () {},
              ),
              productList,
              const SizedBox(height: 16),
              SectionTitle(
                title: 'Special',
                onTap: () {},
              ),
              productList,
              const SizedBox(height: 16),
              SectionTitle(
                title: 'New',
                onTap: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircularIconButton(
          iconData: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        CircularIconButton(
          iconData: Icons.call_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        CircularIconButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        const SizedBox(width: 8)
      ],
    );
  }
}
