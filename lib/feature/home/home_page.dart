import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "기기 리스트",
      ),
      body: SafeArea(
          child: Column(
        children: [
          Gap(5.h),
          deviceRegisterView(),
        ],
      )),
    );
  }

  Widget deviceRegisterView() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary1,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
            child: Row(
              children: [
                Gap(10.w),
                const Expanded(
                  child: Text(
                    'asdaasdasdasd',
                    style: PlamFarmTextStyles.body2Bold,
                  ),
                ),
                Gap(10.w),
                DecoratedBox(
                    decoration: const BoxDecoration(
                      color: PlamFarmColors.palmFarmPrimary5,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        '기기 추가',
                        style: PlamFarmTextStyles.body2Bold
                            .copyWith(color: Colors.white),
                      ).paddingSymmetric(horizontal: 8.w, vertical: 8.w),
                    )),
                Gap(10.w),
              ],
            ),
          ),
        ),
      );
}
