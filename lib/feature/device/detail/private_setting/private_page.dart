import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_delete_history_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_interval_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_life_time_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_led_mode_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/component/private_pump_interval_view.dart';
import 'package:palmfarm/feature/device/detail/private_setting/private_setting_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

@RoutePage()
class PrivateSettingPage extends ConsumerStatefulWidget {
  static const routeName = '/private_setting';

  const PrivateSettingPage({super.key});

  @override
  ConsumerState createState() => _PrivateSettingPageState();
}

class _PrivateSettingPageState extends ConsumerState<PrivateSettingPage> {
  final _viewModel = getIt<PrivateSettingViewModel>();

  @override
  void initState() {
    super.initState();
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
        title: "개인모드 재배 설정",
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
            Gap(13.h),
          ],
        ),
      )),
    );
  }



  Widget _buildNameInputTextFiled() => LabeledInputField(
        controller: TextEditingController(),
        hintText: '등록할 개인모드 명칭을 입력하세요.',
        errorText: null,
        keyboardType: TextInputType.text,
      ).paddingSymmetric(horizontal: 20.w);
}
