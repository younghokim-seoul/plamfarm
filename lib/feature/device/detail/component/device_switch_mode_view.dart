import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/feature/widget/switch/switch_title.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class DeviceSwitchModeView extends ConsumerWidget {
  const DeviceSwitchModeView({super.key, required this.viewModel});

  final DeviceDetailViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(12.h),
          viewModel.ledOnOff.ui(builder: (builder, state) {
            return SwitchTitle(
              value: state.data ?? false,
              onChanged: (v) => viewModel.onChangeLedStatus(v),
              title: Text(
                'LED ON/OFF',
                style: PlamFarmTextStyles.body2Bold.copyWith(
                    color: PlamFarmColors.palmFarmNormalTextColor,
                    fontWeight: FontWeight.w700),
              ),
            );
          }),
          viewModel.pumpOnOff.ui(builder: (builder, state) {
            return SwitchTitle(
              value: state.data ?? false,
              onChanged: (v) => viewModel.onChangePumpStatus(v),
              title: Text(
              '펌프 ON/OFF',
              style: PlamFarmTextStyles.body2Bold.copyWith(
                  color: PlamFarmColors.palmFarmNormalTextColor,
                  fontWeight: FontWeight.w700),
            ),);
          }),
          Gap(24.h),
          DecoratedBox(
            decoration: BoxDecoration(
              color: PlamFarmColors.palmFarmPrimary5,
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
            child: InkWell(
              onTap: () {},
              child: Text(
                '새로고침',
                style: PlamFarmTextStyles.body2Bold
                    .copyWith(color: Colors.white, height: 1.135),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ),
          Gap(40.h),
        ],
      ).paddingSymmetric(horizontal: 18.w, vertical: 18.h),
    );
  }
}
