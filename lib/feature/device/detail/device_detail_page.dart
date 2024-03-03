import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/component/device_active_mode_view.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';

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
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(16.h),
                    const DeviceActiveModeView(),
                  ],
                ),
              ),
          )
      ),
    );
  }
}
