import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:user_list_rest_api/utils/app_size/app_size.dart';
import 'package:user_list_rest_api/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:user_list_rest_api/view/components/custom_text/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actor = Get.arguments;

    Widget infoText(String label) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: CustomText(
          text: label,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(actor: actor),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: actor.image,
              height: 300.h,
              width: double.infinity,
            ),
            Gap(20.h),
            Padding(
              padding: AppSize.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: actor.name,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(10.h),
                  infoText('Actor: ${actor.actor}'),
                  infoText('Date of Birth: ${actor.dateOfBirth}'),
                  infoText('Eye Colour: ${actor.eyeColour}'),
                  infoText('Gender: ${actor.gender}'),
                  infoText('Hair Colour: ${actor.hairColour}'),
                  infoText('House: ${actor.house}'),
                  infoText('Species: ${actor.species}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({super.key, required this.actor});

  final dynamic actor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(50.h),
        InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: AppSize.padding,
            child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
