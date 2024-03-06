import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palmfarm/plam_farm_ui/theme/plam_farm_color.dart';

class LabeledInputField extends StatefulWidget {
  const LabeledInputField({
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.formatters,
    super.key,
  });

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final TextInputType? keyboardType;

  final String? hintText;

  final String? errorText;

  final ValueChanged<String>? onChanged;

  final List<TextInputFormatter>? formatters;

  bool get hasError => errorText != null && errorText!.isNotEmpty;

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  late final _internalFocusNode = FocusNode();
  late final _internalController = TextEditingController();

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;

  TextEditingController get _effectiveController =>
      widget.controller ?? _internalController;

  @override
  void dispose() {
    _internalFocusNode.dispose();
    _internalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: PlamFarmColors.palmFarmPrimary7,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            TextField(
              focusNode: _effectiveFocusNode,
              controller: _effectiveController,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                isCollapsed: true,
                suffixIcon: RepaintBoundary(
                  child: ListenableBuilder(
                    listenable: _effectiveController,
                    builder: (context, _) {
                      return AnimatedOpacity(
                        opacity: _effectiveController.text.isEmpty ? 0 : 1,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                        child: GestureDetector(
                          child: const Icon(
                            CupertinoIcons.clear,
                            size: 24,
                          ),
                          onTap: () {
                            _effectiveFocusNode.requestFocus();
                            _effectiveController.clear();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              inputFormatters: widget.formatters ,
              enableSuggestions: false,
              autocorrect: false,
              textAlignVertical: TextAlignVertical.center,
              // style: GyverLampTextStyles.body2.copyWith(
              //   color: theme.textSecondary,
              // ),
              cursorRadius: const Radius.circular(2),
              cursorWidth: 1.5,
              onChanged: (value) {
                final onChanged = widget.onChanged;

                if (onChanged == null) {
                  return;
                }

                onChanged(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
