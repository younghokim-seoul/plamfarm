import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/app_providers.dart';
import 'package:palmfarm/feature/device/detail/component/farming_mode_box.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/feature/device/detail/led_setting/led_provider.dart';
import 'package:palmfarm/feature/device/detail/led_setting/led_setting_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/dialog/led_time_setting_dialog.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/feature/widget/label_text_filed/range_text_input_formatter.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/helper_message.dart';

@RoutePage()
class LedSettingPage extends ConsumerStatefulWidget {
  static const routeName = '/led_setting';

  const LedSettingPage({super.key, required this.mode, required this.deviceId, required this.detailViewModel});

  final FarmingMode mode;
  final String deviceId;
  final DeviceDetailViewModel detailViewModel;

  @override
  ConsumerState createState() => _LedSettingPageeState();
}

class _LedSettingPageeState extends ConsumerState<LedSettingPage> {
  late LedSettingViewModel _viewModel;

  TextEditingController? _hourController;
  TextEditingController? _minuteController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = ref.read(ledSettingViewModelProvider);
    _viewModel.setPreset(widget.mode, widget.deviceId);
    _viewModel.onLoadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.disposeAll();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(ledStateProvider);
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
              Gap(60.h),
              _buildLedTimeSaveButton(),
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
                  child: _viewModel.ledSettingState.ui(
                    builder: (build, state) {
                      if (!state.hasData || state.data.isNullOrEmpty) {
                        return const SizedBox.shrink();
                      }

                      if (_hourController == null) {
                        _hourController = new TextEditingController(text: state.data!.startTime);
                      }
                      return LabeledInputField(
                        controller: _hourController,
                        hintText: '00 ~ 23',
                        errorText: null,
                        keyboardType: TextInputType.number,
                        formatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CustomRangeTextInputFormatter(min: 0, max: 23),
                        ],
                      );
                    },
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
                  child: _viewModel.ledSettingState.ui(
                    builder: (build, state) {
                      if (!state.hasData || state.data.isNullOrEmpty) {
                        return const SizedBox.shrink();
                      }

                      if (_minuteController == null) {
                        _minuteController = new TextEditingController(text: state.data!.endTime);
                      }

                      return LabeledInputField(
                        controller: _minuteController,
                        hintText: '00 ~ 59',
                        errorText: null,
                        keyboardType: TextInputType.number,
                        formatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CustomRangeTextInputFormatter(min: 0, max: 59),
                        ],
                      );
                    },
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

  Widget _buildLedTimeSaveButton() => Align(
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary5,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: InkWell(
            onTap: () async {
              if (!mounted) return;

              FocusScope.of(context).unfocus();

              String hour = _hourController?.text ?? "";
              String minute = _minuteController?.text ?? "";

              Log.d("::::과연.. hour " + hour + " minute " + minute);
              if (_viewModel.isTextFormCheck(hour, minute)) {
                showLedTimeSettingDialog(
                  context: context,
                  message: '입력한 LED ON 시각 정보를\n기기에 적용하시겠습니까?',
                  onTap: () async => await _viewModel.onClickOnlySave(hour, minute),
                  onImmediateTap: () => widget.detailViewModel.setImmediatelyLed(widget.mode, hour, minute),
                );
              } else {
                AppMessage.showMessage("시간을 모두 입력해주세요");
              }
            },
            child: Text(
              '저장',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
          ),
        ),
      );
}
