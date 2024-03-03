import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/device/scan/scan_view_model.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';
import 'package:palmfarm/feature/widget/appbar/flex_icon_button.dart';
import 'package:palmfarm/injector.dart';

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
    super.dispose();
    _viewModel.disposeAll();
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
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
