import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/screen_util.dart';

const kMaxWidth = 300.0;

Future<void> showNickNameDialog({
  required BuildContext context,
  required String title,
  required String message,
}) {
  return showDialog(
    context: context,
    builder: (context) => NickNameDialog(
      title: title,
      message: message,
    ),
  );
}

class NickNameDialog extends StatelessWidget {
  const NickNameDialog({
    required this.title,
    required this.message,
    super.key,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
      elevation: 0,
      actionsAlignment: MainAxisAlignment.end,
      actionsPadding: const EdgeInsets.all(0),
      actions: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: PlamFarmColors.lightBackground,
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
            },
            child: Text(
              '닫기',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: PlamFarmColors.palmFarmPrimary5),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.w),
          ),
        ).paddingOnly(bottom: 24, right: 12),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary5,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: InkWell(
            onTap: () {
              context.router.pop();
            },
            child: Text(
              '저장하기',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.w),
          ),
        ).paddingOnly(right: 20, bottom: 24)
      ],
      content: SizedBox(
        width: getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Theme.of(context).textTheme.titleMedium!.fontSize! * 1.5,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(message),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
