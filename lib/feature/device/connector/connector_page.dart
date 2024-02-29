import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palmfarm/feature/widget/appbar/custom_app_bar.dart';

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
      appBar: const CustomAppBar(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "기기 추가",
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
