import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';
import 'package:palmfarm/utils/extension/margin_extension.dart';

class PrivateDeleteHistoryView extends ConsumerWidget {
  const PrivateDeleteHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topRight,
      child: Text(
        "개인모드 삭제",
        style: PlamFarmTextStyles.headline6Bold.copyWith(
            color: PlamFarmColors.palmFarmPrimary11,
            fontSize: 14,
            fontWeight: FontWeight.w800),
      ),
    ).paddingSymmetric(horizontal: 20.w);
  }
}
