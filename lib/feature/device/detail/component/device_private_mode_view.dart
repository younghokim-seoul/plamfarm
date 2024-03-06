import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class DevicePrivateModeView extends ConsumerWidget {
  const DevicePrivateModeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 14.w,
        runSpacing: 16.h,
        children: List.generate(10, (index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: PlamFarmColors.palmFarmPrimary6.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: GestureDetector(
              onLongPress: () => context.router.push(PrivateSettingRoute()),
              child: SizedBox(
                width: (1.sw - 2 * 20.w - 14.w) / 2,
                child: Text(
                  '개인모드 ' + (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: PlamFarmTextStyles.headline6Bold.copyWith(
                      color: PlamFarmColors.palmFarmPrimary8, fontWeight: FontWeight.w700, fontSize: 16, height: 1.135),
                  overflow: TextOverflow.ellipsis,
                ).paddingSymmetric(vertical: 16.h),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
