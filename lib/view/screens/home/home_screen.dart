import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_list_rest_api/core/app_routes/app_routes.dart';
import 'package:user_list_rest_api/utils/app_colors/app_colors.dart';
import 'package:user_list_rest_api/utils/app_const/app_const.dart';
import 'package:user_list_rest_api/utils/app_size/app_size.dart';
import 'package:gap/gap.dart';
import 'package:user_list_rest_api/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:user_list_rest_api/view/components/custom_text/custom_text.dart';
import 'package:user_list_rest_api/view/screens/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: AppSize.padding,
        child: Obx(() {
          if (homeController.allActorListStatus.value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final actors = homeController.actorList;

          if (actors.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          return ListView.builder(
            itemCount: actors.length,
            itemBuilder: (context, index) {
              final actor = actors[index];

              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.detailsScreen, arguments: actor);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl: actor.image?.isNotEmpty == true
                            ? actor.image!
                            : AppConstants.profileImage,
                        height: 75.h,
                        width: 75.w,
                      ),
                      Gap(10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: actor.name ?? 'Unknown',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          CustomText(
                            text: actor.house ?? 'No house',
                            fontSize: 16.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: actor.actor ?? 'No actor name',
                            fontSize: 16.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
