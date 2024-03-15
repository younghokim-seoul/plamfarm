import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/feature/device/detail/private_setting/private_setting_view_model.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';
import 'package:palmfarm/utils/extension/value_extension.dart';

class PrivateDeleteHistoryView extends ConsumerWidget {
  const PrivateDeleteHistoryView(
      {super.key, required this.viewModel, required this.onTap});


  final VoidCallback onTap;
  final PrivateSettingViewModel viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: viewModel.isUpdateState.ui(builder: (context, state) {
        if (!state.hasData || state.data.isNullOrEmpty)
          return SizedBox.shrink();

        return InkWell(
          onTap: (){
            if(state.data == true){
              onTap.call();
            }
          },
          child: Text(
            "개인모드 초기화",
            style: PlamFarmTextStyles.headline6Bold.copyWith(
                color: state.data == true
                    ? PlamFarmColors.palmFarmPrimary5
                    : PlamFarmColors.palmFarmPrimary11,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        );
      }),
    ).paddingSymmetric(horizontal: 20.w);
  }
}
