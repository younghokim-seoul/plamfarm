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

Future<void> showDeviceDisconnectDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onTap,
}) {
  return showDialog(
    context: context,
    builder: (context) => DeviceDisconnectDialog(
      title: title,
      message: message,
      onTap: onTap,
    ),
  );
}

class DeviceDisconnectDialog extends StatelessWidget {
  const DeviceDisconnectDialog({
    required this.title,
    required this.message,
    required this.onTap,
    super.key,
  });

  final String title;
  final String message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        elevation: 0,
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.zero,
        actions: [
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
              onTap: () => {
                onTap()
              },
              child: Text(
                '다시 연결',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 36.h),
        ],
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SizedBox(
            width: getScreenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleArea(context),
                Gap(16.h),
                Text(
                  title,
                  style: PlamFarmTextStyles.headline5
                      .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 14, height: 1.7),
                ).paddingSymmetric(horizontal: 5.w),
                Gap(32.h),
                Text(
                  message,
                  style: PlamFarmTextStyles.headline5
                      .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12, fontWeight: FontWeight.w700,height: 1.7),
                ).paddingSymmetric(horizontal: 5.w),
                Gap(60.h),
              ],
            ),
          ),
        ));
  }

  Widget _buildTitleArea(BuildContext context) => Row(
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
