import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/app_providers.dart';
import 'package:palmfarm/data/local/vo/private_setting.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_delete_history_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_interval_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_life_time_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_mode_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_pump_interval_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/private_setting_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/helper_message.dart';

@RoutePage()
class PrivateSettingPage extends ConsumerStatefulWidget {
  static const routeName = '/private_setting';

  const PrivateSettingPage({super.key, required this.privateSetting});

  final PrivateSetting privateSetting;

  @override
  ConsumerState createState() => _PrivateSettingPageState();
}

class _PrivateSettingPageState extends ConsumerState<PrivateSettingPage> {
  late PrivateSettingViewModel _viewModel;

  late TextEditingController _modeNameController;
  late TextEditingController _pumpOnTimeController;
  late TextEditingController _pumpOffTimeController;
  late TextEditingController _ledOnHourController;
  late TextEditingController _ledOnMinuteController;
  late TextEditingController _ledOffHourController;
  late TextEditingController _ledOffMinuteController;

  @override
  void initState() {
    super.initState();

    _viewModel = ref.read(privateSettingViewModelProvider);
    final model = widget.privateSetting;
    _viewModel.setPrivateSetting(model);
    _modeNameController = TextEditingController(text: model.modeName);
    _pumpOnTimeController = _initController(model.pumpOnInterval);
    _pumpOffTimeController = _initController(model.pumpOffInterval);
    _ledOnHourController = _initController(model.ledOnStartTime);
    _ledOnMinuteController = _initController(model.ledOnEndTime);
    _ledOffHourController = _initController(model.ledOffStartTime);
    _ledOffMinuteController = _initController(model.ledOffEndTime);
  }

  @override
  void dispose() {
    _viewModel.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: '개인모드 재배 설정',
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(16.h),
            PrivateDeleteHistoryView(
                viewModel: _viewModel,
                onTap: () async {
                  await _viewModel.savePrivateSetting(
                    widget.privateSetting.copyWith(
                      modeName: "",
                      ledMode: 1,
                      pumpOnInterval: -1,
                      pumpOffInterval: -1,
                      ledOnStartTime: -1,
                      ledOnEndTime: -1,
                      ledOffStartTime: -1,
                      ledOffEndTime: -1,
                    ),
                  );
                  context.router.pop();
                }),
            Gap(16.h),
            _buildNameInputTextFiled(),
            Gap(32.h),
            PrivateLedModeView(
              viewModel: _viewModel,
            ),
            Gap(32.h),
            PrivatePumpIntervalView(
              pumpOnTimeController: _pumpOnTimeController,
              pumpOffTimeController: _pumpOffTimeController,
            ),
            Gap(32.h),
            PrivateLedIntervalView(
              ledOnHourController: _ledOnHourController,
              ledOnMinuteController: _ledOnMinuteController,
              ledOffHourController: _ledOffHourController,
              ledOffMinuteController: _ledOffMinuteController,
              viewModel: _viewModel,
            ),
            Gap(32.h),
            PrivateLedLifeTimeView(
              viewModel: _viewModel,
            ),
            Gap(32.h),
            _buildPrivateSettingSaveButton(),
            Gap(13.h),
          ],
        ),
      )),
    );
  }

  Widget _buildPrivateSettingSaveButton() => Align(
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

              FocusScope.of(context).unfocus();

              final modeName = _modeNameController.text.trim().isEmpty
                  ? ""
                  : _modeNameController.text.trim();
              final pumpOnTime = _parseOrDefault(_pumpOnTimeController, -1);
              final pumpOffTime = _parseOrDefault(_pumpOffTimeController, -1);
              final ledOnHour = _parseOrDefault(_ledOnHourController, -1);
              final ledOnMinute = _parseOrDefault(_ledOnMinuteController, -1);
              final ledOffHour = _parseOrDefault(_ledOffHourController, -1);
              final ledOffMinute = _parseOrDefault(_ledOffMinuteController, -1);
              final ledModel = _viewModel.get().ledMode;

              final privateSettingModel = widget.privateSetting.copyWith(
                  modeName: modeName,
                  pumpOnInterval: pumpOnTime,
                  pumpOffInterval: pumpOffTime,
                  ledOnStartTime: ledOnHour,
                  ledOnEndTime: ledOnMinute,
                  ledOffStartTime: ledOffHour,
                  ledOffEndTime: ledOffMinute,
                  ledMode: ledModel);

              if (!privateSettingModel.isEnableSetting()) {
                AppMessage.showMessage("모든 값을 입력해주세요.");
                return;
              }

              Log.d("privateSettingModel... " + privateSettingModel.toString());
              await _viewModel.savePrivateSetting(privateSettingModel);
              context.router.pop();
            },
            child: Text(
              '등록',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
          ),
        ).paddingOnly(bottom: 24),
      );

  Widget _buildNameInputTextFiled() {
    return LabeledInputField(
      controller: _modeNameController,
      hintText: '등록할 개인모드 명칭을 입력하세요.',
      errorText: null,
      keyboardType: TextInputType.text,
      onClear: () {
        _modeNameController.text = "";
      },
    ).paddingSymmetric(horizontal: 20.w);
  }

  int _parseOrDefault(TextEditingController controller, int defaultValue) {
    final text = controller.text.trim();
    return text.isEmpty ? defaultValue : int.tryParse(text) ?? defaultValue;
  }

  TextEditingController _initController(int value) {
    return TextEditingController(
      text: value != -1 ? value.toString() : "",
    );
  }
}
