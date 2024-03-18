import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

class DevicePrivateModeView extends ConsumerWidget {
  const DevicePrivateModeView({super.key, required this.viewModel});

  final DeviceDetailViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: viewModel.privateSettings.ui(builder: (build, state) {
          if (!state.hasData || state.data.isNullOrEmpty) return Container();
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: 14.w,
            runSpacing: 16.h,
            children: state.data!
                .map((e) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: PlamFarmColors.palmFarmPrimary6
                                .withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          )
                        ],
                      ),
                      child: GestureDetector(
                        onLongPress: () => context.router
                            .push(PrivateSettingRoute(privateSetting: e)),
                        onTap: () => viewModel.setPrivateGrowingMode(e),
                        child: SizedBox(
                          width: 1.sw >= 320 ? (1.sw - 2 * 20.w - 14.w) / 2 : 1.sw,
                          child: Text(
                            e.modeName.isNullOrEmpty
                                ? '개인모드 ' + (e.secretNumber - 10).toString()
                                : e.modeName,
                            textAlign: TextAlign.center,
                            style: PlamFarmTextStyles.headline6Bold.copyWith(
                                color: PlamFarmColors.palmFarmPrimary8,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                height: 1.135),
                            overflow: TextOverflow.ellipsis,
                          ).paddingSymmetric(vertical: 16.h),
                        ),
                      ),
                    ))
                .toList(),
          );
        }));
  }
}
