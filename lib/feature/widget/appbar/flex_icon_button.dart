import 'package:flutter/material.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_theme.dart';

enum FlatIconButtonSize {
  medium,
  large,
}

class FlexIconButton extends StatelessWidget {
  const FlexIconButton({
    required this.size,
    required this.icon,
    required this.onPressed,
    this.color,
    super.key,
  });

  const FlexIconButton.medium({
    required this.icon,
    required this.onPressed,
    this.color,
    super.key,
  }) : size = FlatIconButtonSize.medium;

  const FlexIconButton.large({
    required this.icon,
    required this.onPressed,
    this.color,
    super.key,
  }) : size = FlatIconButtonSize.large;

  final FlatIconButtonSize size;

  final IconData icon;

  final VoidCallback? onPressed;

  final Color? color;

  double get dimension => switch (size) {
        FlatIconButtonSize.medium => 32,
        FlatIconButtonSize.large => 44,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PlamFarmAppTheme>()!;

    return RepaintBoundary(
      child: SizedBox.square(
        dimension: dimension,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            color: color ?? theme.surfacePrimary,
            shape: const CircleBorder(),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              customBorder: const CircleBorder(),
              mouseCursor: onPressed == null
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              onTap: onPressed,
              child: Center(
                child: Icon(
                  icon,
                  size: switch (size) {
                    (FlatIconButtonSize.medium) => 24,
                    (FlatIconButtonSize.large) => 16,
                  },
                  color: onPressed == null
                      ? Colors.black.withOpacity(0.5)
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
