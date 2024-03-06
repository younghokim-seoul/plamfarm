import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/private_setting/provider/private_provider.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class PrivateLedLifeTimeView extends ConsumerWidget {
  const PrivateLedLifeTimeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LED 지속 시각 정보",
          style: PlamFarmTextStyles.headline5Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor,
              fontSize: 12,
              height: 1.1,
              fontWeight: FontWeight.w700),
        ),
        Gap(24.h),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary1,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Text(
                ref.watch(privateStateProvider).ledLiveTime,
                style: PlamFarmTextStyles.headline5Bold.copyWith(
                    color: PlamFarmColors.palmFarmNormalTextColor,
                    fontSize: 12,
                    height: 1.1,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 20.w);
  }
}
