import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class ConnectorPage extends ConsumerStatefulWidget {
  static const routeName = '/connector';

  const ConnectorPage({super.key});

  @override
  ConsumerState createState() => _ConnectorPageState();
}

class _ConnectorPageState extends ConsumerState<ConnectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "기기 추가",
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(4.h),
          _buildBluetoothScanButton(),
          Gap(24.h),
          Text(
            '연결된 디바이스',
            style: PlamFarmTextStyles.buttonLarge.copyWith(
                color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12.sp),
          ),
          Gap(24.h),
          Text(
            '기기 등록하기',
            style: PlamFarmTextStyles.buttonLarge.copyWith(
                color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12.sp),
          ),
          Gap(11.h),
          _buildNameInputTextFiled(),
        ],
      ).paddingSymmetric(horizontal: 20.w)),
    );
  }

  Widget _buildNameInputTextFiled() => LabeledInputField(
        controller: TextEditingController(),
        hintText: '등록할 기기 이름을 입력하세요.',
        errorText: null,
        keyboardType: TextInputType.text,
      );

  Widget _buildBluetoothScanButton() => DecoratedBox(
        decoration: BoxDecoration(
          color: PlamFarmColors.palmFarmPrimary5,
          boxShadow: [
            BoxShadow(
              color: PlamFarmColors.lightShadow1.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 1),
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: InkWell(
          onTap: () async {
            final permissionSet = await createPermissions();
            final permissionStatuses = await permissionSet.request();

            if (!mounted) return;

            bool allPermissionsGranted =
                permissionStatuses.values.every((status) => status.isGranted);

            Log.i(":::allPermissionsGranted $allPermissionsGranted");

            if (allPermissionsGranted) {
              context.router.push(const ScanRoute());
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                '블루투스 연결',
                style: PlamFarmTextStyles.body2Bold
                    .copyWith(color: Colors.white, fontSize: 17.sp),
              ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ),
        ),
      );

  Future<List<Permission>> createPermissions() async {
    List<Permission> permissions = [];
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      permissions.addAll([
        Permission.bluetoothScan,
        Permission.bluetoothConnect,
      ]);

      // Android 11 (API 레벨 30) 이하일 경우 위치 권한 추가
      if (androidInfo.version.sdkInt < 30) {
        permissions.add(Permission.location);
      }
    } else if (Platform.isIOS) {
      // iOS의 경우 위치 권한 추가
      permissions.add(Permission.locationWhenInUse);
    }

    return permissions;
  }
}
