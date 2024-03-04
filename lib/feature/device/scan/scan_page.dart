import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:palmfarm/feature/device/scan/component/scan_result_list_view.dart';
import 'package:palmfarm/feature/device/scan/scan_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/injector.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/dev_log.dart';

@RoutePage()
class ScanPage extends ConsumerStatefulWidget {
  static const routeName = '/scan';

  const ScanPage({super.key});

  @override
  ConsumerState createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  final _viewModel = getIt<ScanViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.startScan();
  }

  @override
  void dispose() {
    Log.d("::::dispose... scan Page");
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
        title: "블루투스 연결",
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
        actions: [
          FlexIconButton.medium(
            icon: CupertinoIcons.refresh_thick,
            onPressed: _viewModel.startScan,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(24.h),
            Text(
              '연결 가능한 리스트',
              style: PlamFarmTextStyles.body2.copyWith(color: PlamFarmColors.palmFarmPrimary6),
            ),
            Gap(24.h),
            Expanded(child: ScanResultListView(viewModel: _viewModel)),
          ],
        ),
      ),
    );
  }
}
