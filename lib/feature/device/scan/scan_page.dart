import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';

@RoutePage()
class ScanPage extends ConsumerStatefulWidget {
  static const routeName = '/scan';

  const ScanPage({super.key});

  @override
  ConsumerState createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "블루투스 연결",
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      )),
    );
  }

}
