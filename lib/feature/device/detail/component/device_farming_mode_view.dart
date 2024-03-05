import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/component/farming_mode_box.dart';

class DeviceFarmingModeView extends ConsumerWidget {
  const DeviceFarmingModeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Flexible(
              child: FarmingModeBox(
            farmingMode: FarmingMode.vegetable,
          )),
          Gap(10.w),
          Flexible(
              child: FarmingModeBox(
            farmingMode: FarmingMode.strawberry,
          )),
          Gap(10.w),
          Flexible(
              child: FarmingModeBox(
            farmingMode: FarmingMode.flowers,
          )),
        ],
      ),
    );
  }
}
