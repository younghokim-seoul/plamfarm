import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/app_providers.dart';
import 'package:palmfarm/assets/assets.gen.dart';
import 'package:palmfarm/feature/device/connector/connector_state.dart';
import 'package:palmfarm/feature/device/connector/connector_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/feature/widget/label_text_filed/labeled_input_field.dart';
import 'package:palmfarm/plam_farm_ui/router/app_route.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class ConnectorPage extends ConsumerStatefulWidget {
  static const routeName = '/connector';

  const ConnectorPage({super.key});

  @override
  ConsumerState createState() => _ConnectorPageState();
}

class _ConnectorPageState extends ConsumerState<ConnectorPage> {
  late ConnectorViewModel _viewModel;
  final _deviceNameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(connectorViewModelProvider);
  }

  @override
  void dispose() {
    _viewModel.disposeAll();
    super.dispose();
  }

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
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(4.h),
              _buildBluetoothScanButton(),
              Gap(24.h),
              Text(
                '연결된 블루투스',
                style: PlamFarmTextStyles.buttonLarge
                    .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12),
              ),
              Gap(12.h),
              _buildConnectorDevice(),
              Gap(60.h),
              Text(
                '기기 등록하기',
                style: PlamFarmTextStyles.buttonLarge
                    .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 12),
              ),
              Gap(11.h),
              _buildNameInputTextFiled(),
              Gap(24.h),
              _buildDeviceSaveButton(),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }

  Widget _buildConnectorDevice() => _viewModel.connectorState.ui(builder: (builder, state) {
        if (!state.hasData || state.data.isNullOrEmpty) {
          return const SizedBox.shrink();
        }

        return Row(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(color: PlamFarmColors.palmFarmPrimary4, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Assets.image.icBle.image(),
              ),
            ),
            Gap(16.w),
            Flexible(
              child: Text(
                "${state.data!.discoveredDevices.name}[${state.data!.discoveredDevices.id}]",
                style: PlamFarmTextStyles.body2
                    .copyWith(color: PlamFarmColors.palmFarmNormalTextColor, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        );
      });

  Widget _buildDeviceSaveButton() => Align(
        alignment: Alignment.center,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: PlamFarmColors.palmFarmPrimary5,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: InkWell(
            onTap: () async {
              await _viewModel.saveConnectorDevice(_deviceNameController.text);
              if (!mounted) return;
              context.router.pop();
            },
            child: Text(
              '등록',
              style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white),
            ).paddingSymmetric(horizontal: 12.w, vertical: 8.h),
          ),
        ).paddingOnly(bottom: 24),
      );

  Widget _buildNameInputTextFiled() => LabeledInputField(
        controller: _deviceNameController,
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

            bool allPermissionsGranted = permissionStatuses.values.every((status) => status.isGranted);

            Log.i(":::allPermissionsGranted $allPermissionsGranted");

            if (allPermissionsGranted) {
              final result = await context.router.push(const ScanRoute());

              if (!result.isNullOrEmpty) {
                final model = result as DiscoveredDevice;
                _viewModel.loadState(
                  ConnectorState(
                    discoveredDevices: model,
                  ),
                );
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                '블루투스 연결',
                style: PlamFarmTextStyles.body2Bold.copyWith(color: Colors.white, fontSize: 17),
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
      if (androidInfo.version.sdkInt < 31) {
        permissions.add(Permission.location);
      }

    } else if (Platform.isIOS) {

    }

    return permissions;
  }
}
