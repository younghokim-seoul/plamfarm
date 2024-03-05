import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/screen_util.dart';

class DeviceActiveModeView extends StatelessWidget {
  const DeviceActiveModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitleView(),
        Gap(24.h),
        _buildSettingInfoView(context),
        Gap(24.h),
        _buildNoticeTile(),
      ],
    );
  }

  Widget _buildTitleView() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '기기 동작 모드 상태',
            style: PlamFarmTextStyles.headline5Bold
                .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 16, fontWeight: FontWeight.w800),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: PlamFarmColors.palmFarmPrimary5,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: PlamFarmColors.palmFarmPrimary6.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: InkWell(
              child: Text(
                '개인모드 추가',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ),
        ],
      );

  //여기서 reload필요.
  Widget _buildSettingInfoView(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildSettingTile(context, title: '재배모드', value: ""),
            Gap(12.h),
            _buildSettingTile(context, title: '펌프 가동주기', value: ""),
            Gap(12.h),
            _buildSettingTile(context, title: 'LED ON 시각', value: ""),
            Gap(12.h),
            _buildSettingTile(context, title: 'LED OFF 시각', value: ""),
          ],
        ).paddingSymmetric(horizontal: 16.w, vertical: 24.h),
      );

  Widget _buildSettingTile(BuildContext context, {required String title, required String value}) => Row(
        children: [
          SizedBox(
            width: getScreenWidth(context) * 0.30,
            child: Text(
              title,
              style: PlamFarmTextStyles.headline5Bold
                  .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: PlamFarmTextStyles.headline5Bold
                  .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      );

  Widget _buildNoticeTile() => Text(
        '동작중인 기기의 LED 펌프 상태는 아래의 ON/OFF 버튼에 표현 됩니다. 만약 1회성으로 현재 동작을 변경하고자 하는 경우 버튼을 이용해주세요. 상태를 재확인 하고싶은 경우에는 새로고침 버튼을 눌러주세요.',
        style: PlamFarmTextStyles.headline5Bold
            .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12, fontWeight: FontWeight.w400),
      );
}
