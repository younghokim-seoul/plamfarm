import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palmfarm/plam_farm_ui/theme/palm_farm_shadows.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_text_styles.dart';

abstract class PlamFarmTheme {
  static ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: false,
      colorScheme: const ColorScheme.light().copyWith(
        surface: PlamFarmColors.lightSurfacePrimary,
        background: PlamFarmColors.lightBackground,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: PlamFarmColors.lightBackground,
      textTheme: PlamFarmTextStyles.textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return const OutlineInputBorder(
                borderSide: BorderSide(
                  color: PlamFarmColors.lightBorderInput,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              );
            }

            return const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: PlamFarmColors.lightBorderPrimary,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            );
          },
        ),
        hoverColor: Colors.transparent,
        constraints: const BoxConstraints.tightFor(height: 42),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        filled: true,
        fillColor: PlamFarmColors.lightSurfacePrimary,
        hintStyle: PlamFarmTextStyles.body2.copyWith(
          color: PlamFarmColors.lightTextSecondary.withOpacity(0.5),
        ),
        suffixIconColor: PlamFarmColors.lightTextSecondary,
      ),
      dividerTheme: const DividerThemeData(
        color: PlamFarmColors.lightDivider,
        thickness: 2,
        space: 2,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: PlamFarmColors.lightSelectionBackground,
        selectionHandleColor: PlamFarmColors.lightSelectionHandle,
        cursorColor: PlamFarmColors.lightTextPrimary,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        // this color will be used as selectionHandleColor on iOS
        primaryColor: PlamFarmColors.lightSelectionHandle,
      ),
      extensions: const [
        PlamFarmAppTheme(
          background: PlamFarmColors.lightBackground,
          onBackground: PlamFarmColors.lightOnBackground,
          surfacePrimary: PlamFarmColors.lightSurfacePrimary,
          surfaceSecondary: PlamFarmColors.lightSurfaceSecondary,
          surfaceVariant: PlamFarmColors.lightSurfaceVariant,
          borderPrimary: PlamFarmColors.lightBorderPrimary,
          borderInput: PlamFarmColors.lightBorderInput,
          textPrimary: PlamFarmColors.lightTextPrimary,
          textSecondary: PlamFarmColors.lightTextSecondary,
          pointer: PlamFarmColors.lightPointer,
          connectedBackground: PlamFarmColors.lightConnectedBackground,
          connectedText: PlamFarmColors.lightConnectedText,
          connectingBackground: PlamFarmColors.lightConnectingBackground,
          connectingText: PlamFarmColors.lightConnectingText,
          notConnectedBackground: PlamFarmColors.lightNotConnectedBackground,
          notConnectedText: PlamFarmColors.lightNotConnectedText,
          divider: PlamFarmColors.lightDivider,
          buttonDisabled: PlamFarmColors.lightButtonDisabled,
          textButtonDisabled: PlamFarmColors.lightTextButtonDisabled,
          selectionBackground: PlamFarmColors.lightSelectionBackground,
          selectionHandle: PlamFarmColors.lightSelectionHandle,
          shadows: PlamFarmShadows.light,
        ),
      ],
    );
  }


  static ThemeData get darkThemeData {
    return ThemeData(
      useMaterial3: false,
      colorScheme: const ColorScheme.dark().copyWith(
        surface: PlamFarmColors.darkSurfacePrimary,
        background: PlamFarmColors.darkBackground,
      ),
      scaffoldBackgroundColor: PlamFarmColors.darkBackground,
      textTheme: PlamFarmTextStyles.textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return const OutlineInputBorder(
                borderSide: BorderSide(
                  color: PlamFarmColors.darkBorderInput,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              );
            }

            return const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.5,
                color: PlamFarmColors.darkBorderPrimary,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            );
          },
        ),
        hoverColor: Colors.transparent,
        constraints: const BoxConstraints.tightFor(height: 42),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        filled: true,
        fillColor: PlamFarmColors.darkSurfacePrimary,
        hintStyle: PlamFarmTextStyles.body2.copyWith(
          color: PlamFarmColors.darkTextSecondary.withOpacity(0.5),
        ),
        suffixIconColor: PlamFarmColors.darkTextSecondary,
      ),
      dividerTheme: const DividerThemeData(
        color: PlamFarmColors.darkDivider,
        thickness: 1,
        space: 1,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: PlamFarmColors.darkSelectionBackground,
        selectionHandleColor: PlamFarmColors.darkSelectionHandle,
        cursorColor: PlamFarmColors.darkTextPrimary,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        // this color will be used as selectionHandleColor on iOS
        primaryColor: PlamFarmColors.darkSelectionHandle,
      ),
      extensions: const [
        PlamFarmAppTheme(
          background: PlamFarmColors.darkBackground,
          onBackground: PlamFarmColors.darkOnBackground,
          surfacePrimary: PlamFarmColors.darkSurfacePrimary,
          surfaceSecondary: PlamFarmColors.darkSurfaceSecondary,
          surfaceVariant: PlamFarmColors.darkSurfaceVariant,
          borderPrimary: PlamFarmColors.darkBorderPrimary,
          borderInput: PlamFarmColors.darkBorderInput,
          textPrimary: PlamFarmColors.darkTextPrimary,
          textSecondary: PlamFarmColors.darkTextSecondary,
          pointer: PlamFarmColors.darkPointer,
          connectedBackground: PlamFarmColors.darkConnectedBackground,
          connectedText: PlamFarmColors.darkConnectedText,
          connectingBackground: PlamFarmColors.darkConnectingBackground,
          connectingText: PlamFarmColors.darkConnectingText,
          notConnectedBackground: PlamFarmColors.darkNotConnectedBackground,
          notConnectedText: PlamFarmColors.darkNotConnectedText,
          divider: PlamFarmColors.darkDivider,
          buttonDisabled: PlamFarmColors.darkButtonDisabled,
          textButtonDisabled: PlamFarmColors.darkTextButtonDisabled,
          selectionBackground: PlamFarmColors.darkSelectionBackground,
          selectionHandle: PlamFarmColors.darkSelectionHandle,
          shadows: PlamFarmShadows.dark,
        ),
      ],
    );
  }
}

class PlamFarmAppTheme extends ThemeExtension<PlamFarmAppTheme> {
  const PlamFarmAppTheme({
    required this.background,
    required this.onBackground,
    required this.surfacePrimary,
    required this.surfaceSecondary,
    required this.surfaceVariant,
    required this.borderPrimary,
    required this.borderInput,
    required this.textPrimary,
    required this.textSecondary,
    required this.pointer,
    required this.connectedBackground,
    required this.connectedText,
    required this.connectingBackground,
    required this.connectingText,
    required this.notConnectedBackground,
    required this.notConnectedText,
    required this.divider,
    required this.buttonDisabled,
    required this.textButtonDisabled,
    required this.selectionBackground,
    required this.selectionHandle,
    required this.shadows,
  });

  /// Background Color
  final Color background;

  /// On Background Color
  final Color onBackground;

  /// Surface Primary Color
  final Color surfacePrimary;

  /// Surface Secondary Color
  final Color surfaceSecondary;

  /// Surface Variant Color
  final Color surfaceVariant;

  /// Border Primary Color
  final Color borderPrimary;

  /// Border Input Color
  final Color borderInput;

  /// Text Primary Color
  final Color textPrimary;

  /// Text Secondary Color
  final Color textSecondary;

  /// Pointer Color
  final Color pointer;

  /// Connected Background Color
  final Color connectedBackground;

  /// Connected Text Color
  final Color connectedText;

  /// Connecting Background Color
  final Color connectingBackground;

  /// Connecting Text Color
  final Color connectingText;

  /// Not Connected Background Color
  final Color notConnectedBackground;

  /// Not Connected Text Color
  final Color notConnectedText;

  /// Divider Color
  final Color divider;

  /// Button Disabled Color
  final Color buttonDisabled;

  /// Text Button Disabled Color
  final Color textButtonDisabled;

  /// Selection Background Color
  final Color selectionBackground;

  /// Selection Handle Color
  final Color selectionHandle;

  /// Shadows
  final PlamFarmShadows shadows;

  @override
  PlamFarmAppTheme copyWith({
    Color? background,
    Color? onBackground,
    Color? surfacePrimary,
    Color? surfaceSecondary,
    Color? surfaceVariant,
    Color? borderPrimary,
    Color? borderInput,
    Color? textPrimary,
    Color? textSecondary,
    Color? pointer,
    Color? connectedBackground,
    Color? connectedText,
    Color? connectingBackground,
    Color? connectingText,
    Color? notConnectedBackground,
    Color? notConnectedText,
    Color? divider,
    Color? buttonDisabled,
    Color? textButtonDisabled,
    Color? selectionBackground,
    Color? selectionHandle,
    PlamFarmShadows? shadows,
  }) {
    return PlamFarmAppTheme(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surfacePrimary: surfacePrimary ?? this.surfacePrimary,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderInput: borderInput ?? this.borderInput,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      pointer: pointer ?? this.pointer,
      connectedBackground: connectedBackground ?? this.connectedBackground,
      connectedText: connectedText ?? this.connectedText,
      connectingBackground: connectingBackground ?? this.connectingBackground,
      connectingText: connectingText ?? this.connectingText,
      notConnectedBackground:
          notConnectedBackground ?? this.notConnectedBackground,
      notConnectedText: notConnectedText ?? this.notConnectedText,
      divider: divider ?? this.divider,
      buttonDisabled: buttonDisabled ?? this.buttonDisabled,
      textButtonDisabled: textButtonDisabled ?? this.textButtonDisabled,
      selectionBackground: selectionBackground ?? this.selectionBackground,
      selectionHandle: selectionHandle ?? this.selectionHandle,
      shadows: shadows ?? this.shadows,
    );
  }

  @override
  PlamFarmAppTheme lerp(PlamFarmAppTheme? other, double t) {
    if (other is! PlamFarmAppTheme) {
      return this;
    }

    return PlamFarmAppTheme(
      background: Color.lerp(
        background,
        other.background,
        t,
      )!,
      onBackground: Color.lerp(
        onBackground,
        other.onBackground,
        t,
      )!,
      surfacePrimary: Color.lerp(
        surfacePrimary,
        other.surfacePrimary,
        t,
      )!,
      surfaceSecondary: Color.lerp(
        surfaceSecondary,
        other.surfaceSecondary,
        t,
      )!,
      surfaceVariant: Color.lerp(
        surfaceVariant,
        other.surfaceVariant,
        t,
      )!,
      borderPrimary: Color.lerp(
        borderPrimary,
        other.borderPrimary,
        t,
      )!,
      borderInput: Color.lerp(
        borderInput,
        other.borderInput,
        t,
      )!,
      textPrimary: Color.lerp(
        textPrimary,
        other.textPrimary,
        t,
      )!,
      textSecondary: Color.lerp(
        textSecondary,
        other.textSecondary,
        t,
      )!,
      pointer: Color.lerp(
        pointer,
        other.pointer,
        t,
      )!,
      connectedBackground: Color.lerp(
        connectedBackground,
        other.connectedBackground,
        t,
      )!,
      connectedText: Color.lerp(
        connectedText,
        other.connectedText,
        t,
      )!,
      connectingBackground: Color.lerp(
        connectingBackground,
        other.connectingBackground,
        t,
      )!,
      connectingText: Color.lerp(
        connectingText,
        other.connectingText,
        t,
      )!,
      notConnectedBackground: Color.lerp(
        notConnectedBackground,
        other.notConnectedBackground,
        t,
      )!,
      notConnectedText: Color.lerp(
        notConnectedText,
        other.notConnectedText,
        t,
      )!,
      divider: Color.lerp(
        divider,
        other.divider,
        t,
      )!,
      buttonDisabled: Color.lerp(
        buttonDisabled,
        other.buttonDisabled,
        t,
      )!,
      textButtonDisabled: Color.lerp(
        textButtonDisabled,
        other.textButtonDisabled,
        t,
      )!,
      selectionBackground: Color.lerp(
        selectionBackground,
        other.selectionBackground,
        t,
      )!,
      selectionHandle: Color.lerp(
        selectionHandle,
        other.selectionHandle,
        t,
      )!,
      shadows: PlamFarmShadows.lerp(
        shadows,
        other.shadows,
        t,
      ),
    );
  }
}
