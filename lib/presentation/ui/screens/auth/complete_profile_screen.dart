import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/input.dart';
import 'package:crafty_bay/presentation/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Logo(width: 85),
                const SizedBox(height: 16),
                Text(
                  "Complete Profile",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Get started with us with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 24),
                Input(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Input(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Input(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Mobile Number",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Input(
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "City Name",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Shipping Address",
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(const MainBottomNavScreen());
                    },
                    child: const Text("Complete"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
