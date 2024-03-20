import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

enum FarmingMode { vegetable, strawberry, flowers }

class FarmingModeBox extends StatelessWidget {
  const FarmingModeBox(
      {super.key,
      required this.farmingMode,
      required this.deviceId,
      required this.viewModel});

  final DeviceDetailViewModel viewModel;
  final FarmingMode farmingMode;
  final String deviceId;

  @override
  Widget build(BuildContext context) {
    final primaryColor = farmingMode.color;
    final primaryImage = farmingMode.image;
    final primaryTitle = farmingMode.title;
    return Padding(
        padding: EdgeInsets.zero,
        child: GestureDetector(
          onLongPress: () => context.router
              .push(LedSettingRoute(mode: farmingMode, deviceId: deviceId,detailViewModel: viewModel)),
          onTap: () => viewModel.setBaseGrowingMode(farmingMode, deviceId),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                primaryImage.image(width: 40, height: 40).marginOnly(left: 8),
                Gap(4.h),
                Text(
                  primaryTitle,
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1.8),
                ).marginOnly(left: 16),
                Gap(15.h),
              ],
            ),
          ),
        ));
  }
}
