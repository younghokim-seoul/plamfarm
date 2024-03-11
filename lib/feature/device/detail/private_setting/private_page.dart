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

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(privateSettingViewModelProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Log.d("::::widget ..  " + widget.privateSetting.toString());
      ref.watch(privateStateProvider.notifier).setPrivateSettingModel(widget.privateSetting);
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
            PrivatePumpIntervalView(),
            Gap(32.h),
            PrivateLedIntervalView(),
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
            onTap: () async {},
            child: Text(
              '등록',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
          ),
        ).paddingOnly(bottom: 24),
      );

  Widget _buildNameInputTextFiled() => LabeledInputField(
        controller: TextEditingController(text: ref.watch(privateStateProvider).modeName),
        hintText: '등록할 개인모드 명칭을 입력하세요.',
        errorText: null,
        keyboardType: TextInputType.text,
        onChanged: (v) => ref.read(privateStateProvider.notifier).onChangedModelName(v),
      ).paddingSymmetric(horizontal: 20.w);
}
