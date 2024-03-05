import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/component/device_active_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_farming_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_private_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_switch_mode_view.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';



@RoutePage()
class DeviceDetailPage extends ConsumerStatefulWidget {
  static const routeName = '/device_detail';

  const DeviceDetailPage({super.key});

  @override
  ConsumerState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends ConsumerState<DeviceDetailPage> {
  // final _viewModel = getIt<ScanViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlamFarmColors.palmFarmPrimary7,
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "연결된 기기 정보",
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
        actions: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: PlamFarmColors.palmFarmPrimary5,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: PlamFarmColors.palmFarmPrimary6.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: InkWell(
              child: Text(
                '개인모드\n추가',
                textAlign: TextAlign.center,
                style: PlamFarmTextStyles.body2Bold
                    .copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
              ).paddingSymmetric(horizontal: 12.w, vertical: 2.h),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                const DeviceActiveModeView(),
                Gap(24.h),
                const DeviceSwitchModeView(),
                Gap(24.h),
                const DeviceFarmingModeView(),
                Gap(16.h),
                DevicePrivateModeView(),
                Gap(16.h),
              ],
            ),
          )),
    );
  }
}
