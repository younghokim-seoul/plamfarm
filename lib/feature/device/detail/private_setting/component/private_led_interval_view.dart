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

class PrivateLedIntervalView extends ConsumerWidget {
  const PrivateLedIntervalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LED ON 시각",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor,
              fontSize: 16,
              height: 1.1,
              fontWeight: FontWeight.w800),
        ),
        Gap(16.h),
        _buildLedOnSettingGroup(ref),
        Gap(32.h),
        Text(
          "LED OFF 시각",
          style: PlamFarmTextStyles.headline6Bold.copyWith(
              color: PlamFarmColors.palmFarmNormalTextColor,
              fontSize: 16,
              height: 1.1,
              fontWeight: FontWeight.w800),
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
                controller: TextEditingController(text: ref.read(privateStateProvider).ledOnHour != -1 ? ref.read(privateStateProvider).ledOnHour.toString() : ""),
                hintText: '00 ~ 23',
                errorText: null,
                keyboardType: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter(min: 0, max: 23),
                ],
                onChanged: (v) => ref.watch(privateStateProvider.notifier).setLedOnHour(v),
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
                controller: TextEditingController(text: ref.read(privateStateProvider).ledOnMinute != -1 ? ref.read(privateStateProvider).ledOnMinute.toString() : ""),
                hintText: '00 ~ 59',
                errorText: null,
                keyboardType: TextInputType.number,
                onChanged: (v) => ref.watch(privateStateProvider.notifier).setLedOnMinute(v),
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter(min: 0, max: 59),
                ],
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
                controller: TextEditingController(text: ref.read(privateStateProvider).ledOffHour != -1 ? ref.read(privateStateProvider).ledOffHour.toString() : ""),
                hintText: '00 ~ 23',
                errorText: null,
                keyboardType: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter(min: 0, max: 23),
                ],
                onChanged: (v) => ref.watch(privateStateProvider.notifier).setLedOffHour(v),
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
                controller: TextEditingController(text: ref.read(privateStateProvider).ledOffMinute != -1 ? ref.read(privateStateProvider).ledOffMinute.toString() : ""),
                hintText: '00 ~ 59',
                errorText: null,
                keyboardType: TextInputType.number,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomRangeTextInputFormatter(min: 0, max: 59),
                ],
                onChanged: (v) => ref.watch(privateStateProvider.notifier).setLedOffMinute(v),
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
