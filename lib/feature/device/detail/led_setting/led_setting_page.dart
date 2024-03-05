import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/component/device_active_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_farming_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_private_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_switch_mode_view.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/feature/widget/label_text_filed/range_text_input_formatter.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

@RoutePage()
class LedSettingPage extends ConsumerStatefulWidget {
  static const routeName = '/led_setting';

  const LedSettingPage({super.key});

  @override
  ConsumerState createState() => _LedSettingPageeState();
}

class _LedSettingPageeState extends ConsumerState<LedSettingPage> {
  final _hourTimeController = TextEditingController();
  final _minuteTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "LED ON 시각",
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(44.h),
              _buildTimeInputGroup(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeInputGroup() => Row(
        children: [
          SizedBox(
            width: (1.sw - 2 * 20.w - 25.w) / 2,
            child: Row(
              children: [
                Expanded(
                  child: LabeledInputField(
                    controller: _hourTimeController,
                    hintText: '00 ~ 23',
                    errorText: null,
                    keyboardType: TextInputType.number,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CustomRangeTextInputFormatter(min: 0, max: 23),
                    ],
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
                    controller: _minuteTimeController,
                    hintText: '00 ~ 59',
                    errorText: null,
                    keyboardType: TextInputType.number,
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
}
