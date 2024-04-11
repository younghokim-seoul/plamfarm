import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/assets/assets.gen.dart';
import 'package:palmfarm/feature/home/home_view_model.dart';
import 'package:palmfarm/feature/widget/dialog/device_setting_dialog.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

class HomeMyDeviceListView extends ConsumerWidget {
  const HomeMyDeviceListView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return viewModel.homeListUiState.ui(builder: (build, state) {
      if (!state.hasData || state.data.isNullOrEmpty) return SizedBox.shrink();

      return ListView.builder(
          primary: true,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          itemCount: state.data!.items.length,
          itemBuilder: (context, index) {
            final model = state.data!.items[index];
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: () => {
                showDeviceSettingDialog(
                  context: context,
                  title: "기기 이름 수정",
                  message: "",
                  device: model,
                  onSaveTap: (String reName) async {
                    Log.d("::::변경할 이름... " + reName);
                    viewModel.onUpdateDevice(model.copyWith(reName: reName));
                    context.router.pop();
                  },
                  onDeleteTap: () async {
                    await viewModel.onDeleteDevice(model);
                    FocusScope.of(context).unfocus();
                    context.router.pop();
                  },
                ),
              },
              onTap: () =>context.router.push(DeviceDetailRoute(palmFarmDevice: model)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Assets.image.icDevice.image(width: 80, height: 80, fit: BoxFit.fill),
                      Gap(16.w),
                      Expanded(
                          child: Text(
                        model.reName,
                        style: PlamFarmTextStyles.body2Bold
                            .copyWith(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                      ))
                    ],
                  ),
                  Gap(4.h),
                ],
              ).paddingSymmetric(vertical: 4),
            );
          });
    });
  }
}
