import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/data/local/vo/palm_farm_device.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/helper_message.dart';
import 'package:palmfarm/utils/screen_util.dart';

const kMaxWidth = 300.0;

Future<void> showDeviceSettingDialog({
  required BuildContext context,
  required String title,
  required String message,
  required PalmFarmDevice device,
  required Function(String reName) onSaveTap,
  required VoidCallback onDeleteTap,
}) {
  return showDialog(
    context: context,
    builder: (context) => DeviceSettingDialog.preset(
      title: title,
      message: message,
      device: device,
      onSaveTap: onSaveTap,
      onDeleteTap: onDeleteTap,
    ),
  );
}

class DeviceSettingDialog extends StatelessWidget {
  DeviceSettingDialog({
    required this.title,
    required this.message,
    required this.device,
    required this.onSaveTap,
    required this.onDeleteTap,
    required this.textEditingController,
    super.key,
  });

  DeviceSettingDialog.preset({
    required this.title,
    required this.message,
    required this.device,
    required this.onSaveTap,
    required this.onDeleteTap,
}) : textEditingController = TextEditingController(text: device.reName);

  final String title;
  final String message;
  final PalmFarmDevice device;

  final Function(String reName) onSaveTap;
  final VoidCallback onDeleteTap;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
        elevation: 0,
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.all(36.w),
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
                onDeleteTap.call();
              },
              child: Text(
                '목록삭제',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: PlamFarmColors.palmFarmPrimary5),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 24, right: 24),
          DecoratedBox(
            decoration: const BoxDecoration(
              color: PlamFarmColors.palmFarmPrimary5,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () {
                if(textEditingController.text.isNullOrEmpty){
                  AppMessage.showMessage("이름을 입력해주세요.");
                  return;
                }
                onSaveTap.call(textEditingController.text);
              },
              child: Text(
                '저장하기',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(right: 24, bottom: 24),
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
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ).paddingOnly(bottom: 24),
        ],
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SizedBox(
            width: getScreenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitleArea(context),
                Gap(16.h),
                _buildNameInputTextFiled(),
                Gap(40.h),
              ],
            ),
          ),
        ));
  }

  Widget _buildTitleArea(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: PlamFarmTextStyles.buttonLarge.copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 16),
          ),
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

  Widget _buildNameInputTextFiled() {
    return LabeledInputField(
      controller: textEditingController,
      hintText: '기기 이름을 입력해주세요.',
      errorText: null,
      keyboardType: TextInputType.text,
    );
  }
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
