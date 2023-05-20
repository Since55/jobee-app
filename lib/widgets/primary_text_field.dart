import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jobee_app/core/app_theme.dart';

class PrimaryTextField extends StatefulWidget {
  final String? hint;
  final bool obscure;
  final int? maxLines;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final void Function(String value)? onChange;
  final bool enabled;
  final TextInputAction? textInputAction;
  final void Function()? onTap;

  const PrimaryTextField({
    super.key,
    this.hint,
    this.prefix,
    this.suffix,
    this.maxLines,
    this.onChange,
    this.fillColor,
    this.onTap,
    this.padding,
    this.validator,
    this.maxLength,
    this.controller,
    this.formatters,
    this.keyboardType,
    this.obscure = false,
    this.textInputAction,
    this.enabled = true,
  });

  @override
  State<PrimaryTextField> createState() => PrimaryTextFieldState();
}

class PrimaryTextFieldState extends State<PrimaryTextField> {
  final _focusNode = FocusNode();
  late TextEditingController controller;
  Timer? _validationTimer;

  String? errorMessage;
  bool get isValid => errorMessage == null;

  TextStyle get _textStyle {
    return TextStyle(
      fontSize: 16,
      height: 1,
      color: widget.enabled
          ? AppTheme.colors.primaryTextColor
          : const Color.fromRGBO(163, 171, 190, 1),
    );
  }

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChange(String value) {
    _validate();
    widget.onChange?.call(value);
  }

  void _validate() {
    _validationTimer?.cancel();
    if (errorMessage != null) setValid();

    _validationTimer = Timer(const Duration(milliseconds: 1500), () {
      final validatorResult = widget.validator?.call(controller.text);
      if (validatorResult != errorMessage) {
        setState(() => errorMessage = validatorResult);
      }
    });
  }

  void setForceInvalid() {
    setState(() => errorMessage = '');
  }

  void setValid([bool force = true]) {
    if (force || (errorMessage?.isEmpty ?? true)) {
      setState(() => errorMessage = null);
    }
  }

  Color _getColor() => Colors.white;

  Color _getBorderColor() {
    if (_focusNode.hasFocus) return AppTheme.colors.primaryTextColor;
    return AppTheme.colors.primaryTextColor.withOpacity(.3);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  if (_focusNode.hasFocus)
                    const BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 1.2,
                    ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: _getColor(),
                border: Border.all(color: _getBorderColor()),
              ),
              child: Row(
                children: [
                  if (widget.prefix != null) ...[
                    widget.prefix!,
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: TextFormField(
                      style: _textStyle,
                      focusNode: _focusNode,
                      controller: controller,
                      onChanged: _handleChange,
                      maxLength: widget.maxLength,
                      keyboardType: widget.keyboardType,
                      inputFormatters: widget.formatters,
                      obscureText: widget.obscure,
                      obscuringCharacter: '*',
                      textInputAction: widget.textInputAction,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: widget.maxLines ?? 1,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: widget.hint,
                        enabled: widget.enabled,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        errorStyle: const TextStyle(fontSize: 0, height: 0),
                      ),
                    ),
                  ),
                  if (widget.suffix != null) ...[
                    const SizedBox(width: 8),
                    widget.suffix!,
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
