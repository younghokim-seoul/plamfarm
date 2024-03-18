import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/private_setting/private_setting_view_model.dart';
import 'package:palmfarm/feature/widget/switch/radio_group.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class PrivateLedModeView extends ConsumerWidget {
  const PrivateLedModeView({super.key, required this.viewModel});

  final PrivateSettingViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LED 모드",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor,
              fontSize: 16,
              height: 1.1,
              fontWeight: FontWeight.w800),
        ).paddingSymmetric(horizontal: 20.w),
        Gap(12.h),
        viewModel.privateUiSettingState.ui(builder: (build, state) {
          return Column(
            children: List<Widget>.generate(
                2,
                (index) => RadioGroup<int>(
                      contentPadding: EdgeInsets.zero,
                      value: index,
                      groupValue: viewModel.get().ledMode -1,
                      onChanged: (v) => {viewModel.onChangedLedMode(v! + 1)},
                      toggleable: false,
                      title: Text(
                        index == 0 ? "PURPLE MODE" : "RED MODE",
                        style: PlamFarmTextStyles.headline5Bold.copyWith(
                            color: PlamFarmColors.palmFarmNormalTextColor,
                            fontSize: 16,
                            height: 1.1,
                            fontWeight: FontWeight.w700),
                      ),
                    ).paddingSymmetric(horizontal: 13.w)).toList(),
          );
        }),
        Gap(16.h),
        DecoratedBox(
          decoration: BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary7,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PURPLE MODE",
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 12,
                      height: 1.1,
                      fontWeight: FontWeight.w700),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: PlamFarmColors.palmFarmPrimary9,
                            width: 1,
                          ),
                          shape: BoxShape.circle),
                    ),
                    Gap(4.w),
                    Text(
                      "WHITE",
                      style: PlamFarmTextStyles.body2.copyWith(
                        color: PlamFarmColors.palmFarmNormalTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(8.w),
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                    Gap(4.w),
                    Text(
                      "RED",
                      style: PlamFarmTextStyles.body2.copyWith(
                        color: PlamFarmColors.palmFarmNormalTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(8.w),
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: PlamFarmColors.palmFarmPrimary12,
                          shape: BoxShape.circle),
                    ),
                    Gap(4.w),
                    Text(
                      "BLUE LED가 조합된 모드",
                      style: PlamFarmTextStyles.body2.copyWith(
                        color: PlamFarmColors.palmFarmNormalTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Gap(16.h),
                Text(
                  "RED MODE",
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 12,
                      height: 1.1,
                      fontWeight: FontWeight.w700),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: PlamFarmColors.palmFarmPrimary9,
                            width: 1,
                          ),
                          shape: BoxShape.circle),
                    ),
                    Gap(4.w),
                    Text(
                      "WHITE",
                      style: PlamFarmTextStyles.body2.copyWith(
                        color: PlamFarmColors.palmFarmNormalTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Gap(8.w),
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                    Gap(4.w),
                    Text(
                      "RED LED가 조합된 모드",
                      style: PlamFarmTextStyles.body2.copyWith(
                        color: PlamFarmColors.palmFarmNormalTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
