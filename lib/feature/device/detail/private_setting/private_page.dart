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
import 'package:palmfarm/feature/device/detail/private_setting/provider/private_provider.dart';

import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';

import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

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
  late  TextEditingController _pumpOnTimeController;
  late TextEditingController _pumpOffTimeController;
  late TextEditingController _ledOnHourController;
  late TextEditingController _ledOnMinuteController;
  late TextEditingController _ledOffHourController;
  late TextEditingController _ledOffMinuteController;

  @override
  void initState() {
    super.initState();

    final model = widget.privateSetting;
    _modeNameController = TextEditingController(text: "");
    _pumpOnTimeController =
        TextEditingController(text: model.pumpOnInterval != -1 ? model.pumpOnInterval.toString() : "");
    _pumpOffTimeController =
        TextEditingController(text: model.pumpOffInterval != -1 ? model.pumpOffInterval.toString() : "");
    _ledOnHourController =
        TextEditingController(text: model.ledOnStartTime != -1 ? model.ledOnStartTime.toString() : "");
    _ledOnMinuteController = TextEditingController(text: model.ledOnEndTime != -1 ? model.ledOnEndTime.toString() : "");
    _ledOffHourController =
        TextEditingController(text: model.ledOffStartTime != -1 ? model.ledOffStartTime.toString() : "");
    _ledOffMinuteController =
        TextEditingController(text: model.ledOffEndTime != -1 ? model.ledOffEndTime.toString() : "");


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _viewModel = ref.read(privateSettingViewModelProvider);
    });
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
            PrivateDeleteHistoryView(),
            Gap(16.h),
            _buildNameInputTextFiled(),
            Gap(32.h),
            PrivateLedModeView(),
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
              ledOffMinuteController: _ledOnMinuteController,
            ),
            Gap(32.h),
            PrivateLedLifeTimeView(),
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

              final modeName = _modeNameController.text.isNullOrEmpty ? "" : _modeNameController.text;
              final pumpOnTime = _pumpOnTimeController.text.isNullOrEmpty ? "-1" :  _pumpOnTimeController.text;
              final pumpOffTime = _pumpOffTimeController.text.isNullOrEmpty ? "-1" :  _pumpOffTimeController.text;
              final ledOnHour = _ledOnHourController.text.isNullOrEmpty ? "-1" :  _ledOnHourController.text;
              final ledOnMinute = _ledOnMinuteController.text.isNullOrEmpty ? "-1" :  _ledOnMinuteController.text;
              final ledOffHour = _ledOffHourController.text.isNullOrEmpty ? "-1" :  _ledOffHourController.text;
              final ledOffMinute = _ledOffMinuteController.text.isNullOrEmpty ? "-1" :  _ledOffMinuteController.text;


              final privateSettingModel = widget.privateSetting.copyWith(
                modeName: modeName,
                pumpOnInterval: int.parse(pumpOnTime),
                pumpOffInterval: int.parse(pumpOffTime),
                ledOnStartTime: int.parse(ledOnHour),
                ledOnEndTime: int.parse(ledOnMinute),
                ledOffStartTime: int.parse(ledOffHour),
                ledOffEndTime: int.parse(ledOffMinute),
              );

              Log.d("privateSettingModel... " + privateSettingModel.toString());
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
    ).paddingSymmetric(horizontal: 20.w);
  }
}
