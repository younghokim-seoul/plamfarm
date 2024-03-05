import 'package:flutter/material.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:yaru_widgets/widgets.dart';



class SwitchTitle extends StatelessWidget {
  const SwitchTitle({
    super.key,
    required this.value,
    required this.onChanged,
    this.tileColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.secondary,
    this.selected = false,
    this.autofocus = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.shape,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.enableFeedback,
    this.hoverColor,
    this.mouseCursor,
  }) : assert(!isThreeLine || subtitle != null);

  final bool value;

  final ValueChanged<bool>? onChanged;

  final Color? tileColor;

  final Widget? title;

  final Widget? subtitle;

  final Widget? secondary;

  final bool isThreeLine;

  final bool? dense;

  final EdgeInsetsGeometry? contentPadding;

  final bool selected;

  final bool autofocus;

  final ListTileControlAffinity controlAffinity;

  final ShapeBorder? shape;

  final Color? selectedTileColor;

  final VisualDensity? visualDensity;

  final FocusNode? focusNode;

  final bool? enableFeedback;

  final Color? hoverColor;

  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    final control = YaruSwitch(
      selectedColor: PlamFarmColors.palmFarmPrimary5,
      value: value,
      onChanged: onChanged,
      autofocus: autofocus,
      mouseCursor: mouseCursor,
    );

    Widget? leading, trailing;
    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
        leading = control;
        trailing = secondary;
        break;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        leading = secondary;
        trailing = control;
        break;
    }

    return MergeSemantics(
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        isThreeLine: isThreeLine,
        dense: dense,
        contentPadding: EdgeInsets.zero,
        enabled: onChanged != null,
        onTap: null,
        selected: selected,
        selectedTileColor: selectedTileColor,
        autofocus: autofocus,
        shape: shape,
        tileColor: tileColor,
        visualDensity: visualDensity,
        focusNode: focusNode,
        enableFeedback: enableFeedback,
        hoverColor: hoverColor,
        mouseCursor: mouseCursor,
      ),
    );
  }
}
