import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/detail/device_detail_view_model.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:palmfarm/utils/screen_util.dart';

class DeviceActiveModeView extends StatelessWidget {
  const DeviceActiveModeView({super.key, required this.viewModel});

  final DeviceDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(16.h),
        _buildSettingInfoView(context),
        Gap(24.h),
        _buildNoticeTile(),
      ],
    );
  }

  //여기서 reload필요.
  Widget _buildSettingInfoView(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child:
            viewModel.deviceCurrentStateUiState.ui(builder: (builder, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(24.h),
              Text(
                '기기 동작 모드 상태',
                style: PlamFarmTextStyles.headline5Bold.copyWith(
                    color: PlamFarmColors.palmFarmNormalTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 1.17),
              ),
              Gap(32.h),
              _buildSettingTile(context,
                  title: '재배모드',
                  value: (!state.hasData || state.data.isNullOrEmpty)
                      ? ""
                      : state.data!.modeName),
              Gap(12.h),
              _buildSettingTile(context,
                  title: '펌프 가동주기',
                  value: (!state.hasData || state.data.isNullOrEmpty)
                      ? ""
                      : "ON:" +
                          state.data!.pumpOnInterval +
                          "분" +
                          " OFF:" +
                          state.data!.pumpOffInterval +
                          "분"),
              Gap(12.h),
              _buildSettingTile(context,
                  title: 'LED ON 시각',
                  value: (!state.hasData || state.data.isNullOrEmpty)
                      ? ""
                      : state.data!.ledOnTime.formatTimeString),
              Gap(12.h),
              _buildSettingTile(context,
                  title: 'LED OFF 시각',
                  value: (!state.hasData || state.data.isNullOrEmpty)
                      ? ""
                      : state.data!.ledOffTime.formatTimeString),
              Gap(24.h),
            ],
          ).paddingSymmetric(horizontal: 36.w);
        }),
      );

  Widget _buildSettingTile(BuildContext context,
          {required String title, required String value}) =>
      Row(
        children: [
          SizedBox(
            width: getScreenWidth(context) * 0.29,
            child: Text(
              title,
              style: PlamFarmTextStyles.headline5Bold.copyWith(
                  color: PlamFarmColors.palmFarmNormalTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: PlamFarmTextStyles.headline5Bold.copyWith(
                  color: PlamFarmColors.palmFarmNormalTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      );

  Widget _buildNoticeTile() => Text(
        '동작중인 기기의 LED 및 펌프 상태는 아래의 ON/OFF 버튼에 표현 됩니다.\n만약 1회성으로 현재 동작을 변경하고자 하는 경우 버튼을 이용해주세요.\n상태를 재확인 하고싶은 경우에는 새로고침 버튼을 눌러주세요.',
        textAlign: TextAlign.start,
        style: PlamFarmTextStyles.headline5Bold.copyWith(
            color: PlamFarmColors.palmFarmNormalTextColor,
            fontSize: 11,
            fontWeight: FontWeight.w400),
      ).paddingSymmetric(horizontal: 20.w);
}

extension ConvertGrowingMode on String {
  String get growingMode {
    switch (this) {
      case "00":
        return "Power Off";
      case "01":
        return "채소모드";
      case "02":
        return "딸기모드";
      case "03":
        return "화훼모드";
      default:
        return "";
    }
  }

  String get formatTimeString {
    if (this.length != 4) {
      return "잘못된 시간 타입";
    }
    String hours = this.substring(0, 2);
    String minutes = this.substring(2, 4);

    return "$hours시 $minutes분";
  }
}
