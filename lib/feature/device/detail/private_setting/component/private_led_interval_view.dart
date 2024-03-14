import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/private_setting/private_setting_view_model.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/feature/widget/label_text_filed/range_text_input_formatter.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class PrivateLedIntervalView extends ConsumerWidget {

  const PrivateLedIntervalView({
     this.ledOnHourController,
     this.ledOnMinuteController,
     this.ledOffHourController,
     this.ledOffMinuteController,
     required this.viewModel,
     super.key,
   });


  final PrivateSettingViewModel viewModel;
  final TextEditingController? ledOnHourController;
  final TextEditingController? ledOnMinuteController;
  final TextEditingController? ledOffHourController;
  final TextEditingController? ledOffMinuteController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LED ON 시각",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 16, height: 1.1, fontWeight: FontWeight.w800),
        ),
        Gap(16.h),
        _buildLedOnSettingGroup(ref),
        Gap(32.h),
        Text(
          "LED OFF 시각",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 16, height: 1.1, fontWeight: FontWeight.w800),
        ),
        Gap(16.h),
        _buildLedOffSettingGroup(ref),
      ],
    ).paddingSymmetric(horizontal: 20.w);
  }

  Widget _buildLedOnSettingGroup(WidgetRef ref) => Row(
        children: [
          SizedBox(
            width: (1.sw - 2 * 20.w - 25.w) / 2,
            child: Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    controller: ledOnHourController,
                    hintText: '00 ~ 23',
                    errorText: null,
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomRangeTextInputFormatter(min: 0, max: 23),
                    ],
                    onChanged: (v) => viewModel.setLedOnHour(v),
                    onClear: () => viewModel.setLedOnHour(""),
                  ),
                ),
                Gap(16.w),
                Text(
                  '시',
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.17),
                ),
              ],
            ),
          ),
          Gap(25.w),
          SizedBox(
            width: (1.sw - 2 * 20.w - 25.w) / 2,
            child: Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    controller: ledOnMinuteController,
                    hintText: '00 ~ 59',
                    errorText: null,
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomRangeTextInputFormatter(min: 0, max: 59),
                    ],
                    onChanged: (v) => viewModel.setLedOnMinute(v),
                    onClear: () => viewModel.setLedOnMinute(""),
                  ),
                ),
                Gap(16.w),
                Text(
                  '분',
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.17),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildLedOffSettingGroup(WidgetRef ref) => Row(
        children: [
          SizedBox(
            width: (1.sw - 2 * 20.w - 25.w) / 2,
            child: Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    controller: ledOffHourController,
                    hintText: '00 ~ 23',
                    errorText: null,
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomRangeTextInputFormatter(min: 0, max: 23),
                    ],
                    onChanged: (v) => viewModel.setLedOffHour(v),
                    onClear: () => viewModel.setLedOffHour(""),
                  ),
                ),
                Gap(16.w),
                Text(
                  '시',
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.17),
                ),
              ],
            ),
          ),
          Gap(25.w),
          SizedBox(
            width: (1.sw - 2 * 20.w - 25.w) / 2,
            child: Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    controller: ledOffMinuteController,
                    hintText: '00 ~ 59',
                    errorText: null,
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomRangeTextInputFormatter(min: 0, max: 59),
                    ],
                    onChanged: (v) => viewModel.setLedOffMinute(v),
                    onClear: () => viewModel.setLedOffMinute(""),
                  ),
                ),
                Gap(16.w),
                Text(
                  '분',
                  style: PlamFarmTextStyles.headline5Bold.copyWith(
                      color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.17),
                ),
              ],
            ),
          ),
        ],
      );
}
