import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/private_setting/provider/private_provider.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/feature/widget/label_text_filed/range_text_input_formatter.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class PrivatePumpIntervalView extends ConsumerWidget {
  const PrivatePumpIntervalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "펌프 주기",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor,
              fontSize: 16,
              height: 1.1,
              fontWeight: FontWeight.w800),
        ),
        Gap(16.h),
        SizedBox(
          width: (1.sw) / 2,
          child: Row(
            children: [
              Text(
                'ON',
                style: PlamFarmTextStyles.body2.copyWith(
                    color: PlamFarmColors.palmFarmNormalTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.17),
              ),
              Gap(16.w),
              Expanded(
                child: LabeledInputField(
                  hintText: '00 ~ 59',
                  errorText: null,
                  keyboardType: TextInputType.number,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter(min: 0, max: 59),
                  ],
                  onChanged: (v) => ref.watch(privateStateProvider.notifier).setPumpOnInterval(v),
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
        Gap(24.h),
        SizedBox(
          width: (1.sw) / 2,
          child: Row(
            children: [
              Text(
                'OFF',
                style: PlamFarmTextStyles.body2.copyWith(
                    color: PlamFarmColors.palmFarmNormalTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.17),
              ),
              Gap(10.w),
              Expanded(
                child: LabeledInputField(
                  hintText: '01 ~ 60',
                  errorText: null,
                  keyboardType: TextInputType.number,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter(min: 1, max: 60),
                  ],
                  onChanged: (v) => ref.watch(privateStateProvider.notifier).setPumpOffInterval(v),
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
    ).paddingSymmetric(horizontal: 20.w);
  }
}
