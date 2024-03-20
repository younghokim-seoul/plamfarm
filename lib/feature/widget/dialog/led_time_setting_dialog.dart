import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/screen_util.dart';

const kMaxWidth = 300.0;

Future<void> showLedTimeSettingDialog({
  required BuildContext context,
  required String message,
  required VoidCallback onTap,
  required VoidCallback onImmediateTap,
}) {
  return showDialog(
    context: context,
    builder: (context) =>
        LedTimeSettingDialog(
            message: message,
            onTap: onTap,
            onImmediateTap: onImmediateTap
        ),
  );
}

class LedTimeSettingDialog extends StatelessWidget {
  const LedTimeSettingDialog({
    required this.message,
    required this.onTap,
    required this.onImmediateTap,
    super.key,
  });

  final String message;
  final VoidCallback onTap;
  final VoidCallback onImmediateTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        elevation: 0,
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actionsPadding: EdgeInsets.zero,
        actions: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: PlamFarmColors.palmFarmPrimary5,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () {
                context.router.pop();
                onImmediateTap.call();
              },
              child: Text(
                '바로 적용',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: PlamFarmColors.palmFarmPrimary5),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 36.h),
          DecoratedBox(
            decoration: BoxDecoration(
              color: PlamFarmColors.palmFarmPrimary5,
              border: Border.all(
                color: PlamFarmColors.palmFarmPrimary5,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () {
                context.router.pop();
                onTap.call();
              },
              child: Text(
                '저장 하기',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 36.h),

          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: PlamFarmColors.palmFarmPrimary5,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () => context.router.pop(),
              child: Text(
                '취소',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: PlamFarmColors.palmFarmPrimary5),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 36.h),
        ],
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SizedBox(
            width: getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleArea(context),
                Gap(16.h),
                Text(
                  message,
                  style: PlamFarmTextStyles.body2Bold
                      .copyWith(color: PlamFarmColors.palmFarmNormalTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.1),
                ).paddingSymmetric(horizontal: 5.w),
                Gap(52.h),
              ],
            ),
          ),
        ));
  }

  Widget _buildTitleArea(BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            splashFactory: InkRipple.splashFactory,
            onTap: () {
              context.router.pop();
            },
            child: const _Icon(
              icon: CupertinoIcons.clear,
            ),
          )
        ],
      );
}

class _Icon extends StatelessWidget {
  const _Icon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 24,
      color: Colors.black,
    );
  }
}
