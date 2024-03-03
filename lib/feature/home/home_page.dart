import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/dialog/nick_name_dialog.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(4.h),
          deviceRegisterView(),
          Gap(24.h),
          deviceListText(),
        ],
      )),
    );
  }

  Widget deviceListText() => Text(
        '나의 기기 목록',
        style: PlamFarmTextStyles.buttonLarge.copyWith(color: const Color(0XFF383D50)),
      ).paddingSymmetric(horizontal: 20.w);

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
            padding: const EdgeInsets.only(left: 16, right: 16, top: 17, bottom: 17),
            child: Row(
              children: [
                Gap(10.w),
                 Expanded(
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () => showNickNameDialog(context: context, title: "이름 수정하기", message: ""),
                    child: const Text(
                      'asdaasdasdasd',
                      style: PlamFarmTextStyles.body2Bold,
                    ),
                  )
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
                      onTap: () => context.router.push(const DeviceDetailRoute()),
                      child: Text(
                        '기기 추가',
                        style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
                      ).paddingSymmetric(horizontal: 12.w, vertical: 8.w),
                    )),
                Gap(10.w),
              ],
            ),
          ),
        ),
      );
}
