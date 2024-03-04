import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/home/home_view_model.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

class HomeMyDeviceListView extends ConsumerWidget {
  const HomeMyDeviceListView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return viewModel.homeListUiState.ui(builder: (build, state) {
      if (!state.hasData || state.data.isNullOrEmpty) return Container();

      return ListView.builder(
          primary: true,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          itemCount: state.data!.items.length,
          itemBuilder: (context, index) {
            final model = state.data!.items[index];
            return InkWell(
              onTap: () => {
                context.router.push(const DeviceDetailRoute())
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DecoratedBox(
                          decoration: const BoxDecoration(
                            color: PlamFarmColors.palmFarmPrimary4,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: PlamFarmTextStyles.body2Bold.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ).paddingSymmetric(horizontal: 16.w, vertical: 14.h)),
                      Gap(16.w),
                      Flexible(
                          child: Text(
                        model.name,
                        style: PlamFarmTextStyles.body2Bold.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
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
