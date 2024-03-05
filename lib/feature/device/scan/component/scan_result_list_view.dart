import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/scan/scan_view_model.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

class ScanResultListView extends ConsumerWidget {
  const ScanResultListView({super.key, required this.viewModel});

  final ScanViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return viewModel.scanListUiState.ui(builder: (build, state) {
      if (!state.hasData || state.data.isNullOrEmpty) return Container();

      return ListView.builder(
          primary: true,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          itemCount: state.data!.discoveredDevices.length,
          itemBuilder: (context, index) {
            final model = state.data!.discoveredDevices[index];
            return InkWell(
              onTap: () => context.router.pop(model),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.h,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          color: PlamFarmColors.palmFarmPrimary4,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          (index + 1).toString(),
                          textAlign: TextAlign.center,
                          style: PlamFarmTextStyles.body2Bold
                              .copyWith(color: Colors.black, fontWeight: FontWeight.w700, height: 1.583, fontSize: 16),
                        ).marginOnly(top: 4),
                      ),
                      Gap(16.w),
                      Flexible(
                          child: Text(
                        model.name,
                        style: PlamFarmTextStyles.body2Bold
                            .copyWith(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                      ))
                    ],
                  ),
                  Gap(4.h),
                ],
              ),
            );
          });
    });
  }
}
