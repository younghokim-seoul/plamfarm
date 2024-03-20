import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/app_providers.dart';
import 'package:palmfarm/assets/assets.gen.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/feature/device/connection_ui_state.dart';
import 'package:palmfarm/feature/device/detail/component/device_active_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_farming_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_private_mode_view.dart';
import 'package:palmfarm/feature/device/detail/component/device_switch_mode_view.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/dialog/device_disconnect_dialog.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/utils/constant.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class DeviceDetailPage extends ConsumerStatefulWidget {
  static const routeName = '/device_detail';

  const DeviceDetailPage({super.key, required this.palmFarmDevice});

  final PalmFarmDevice palmFarmDevice;

  @override
  ConsumerState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends ConsumerState<DeviceDetailPage> {
  late DeviceDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(deviceDetailViewModelProvider);
    _viewModel.loadPrivateSetting(widget.palmFarmDevice.macAddress);
    _viewModel.connect(widget.palmFarmDevice.macAddress);
    setObserve();
  }

  void setObserve() {
    _viewModel.connectionUiState.stream.listen((event) {
      if (event is Connected) {
        Log.d("::Connected!!...");
      }

      if (event is Disconnected) {
        if (mounted) {
          showDeviceDisconnectDialog(
              context: context,
              title: dialog_disconnect_title,
              message: dialog_disconnect_content,
              onTap: () {
                context.router.pop();
                _viewModel.connect(widget.palmFarmDevice.macAddress);
              });
        }
      }
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
      backgroundColor: PlamFarmColors.palmFarmPrimary7,
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        deviceIcon: Assets.image.icDevice.image(),
        title: widget.palmFarmDevice.reName,
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16.h),
              DeviceActiveModeView(
                viewModel: _viewModel,
              ),
              Gap(24.h),
              DeviceSwitchModeView(
                viewModel: _viewModel,
              ),
              Gap(24.h),
              DeviceFarmingModeView(
                deviceId: widget.palmFarmDevice.macAddress,
                viewModel: _viewModel,
              ),
              Gap(16.h),
              DevicePrivateModeView(
                viewModel: _viewModel,
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => launchUrl(Uri.parse('https://cafe.naver.com/palmfarmmarket')),
        child: Assets.image.icBanner.image(
          width: 1.sw,
          height: 66.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
