import 'package:flutter/material.dart';
import 'package:jobee_app/core/app_theme.dart';
import 'package:jobee_app/widgets/material_inkwell.dart';

class PrimaryButtonTheme {
  final Color color;
  final Color textColor;
  final Color loaderColor;
  final Color? splashColor;
  final Color? borderColor;
  final Color disabledColor;
  final Color? disabledBorderColor;
  final Color? disabledTextColor;
  final Color? loadingColor;
  final Color? loadingBorderColor;
  final Color? loadingTextColor;

  const PrimaryButtonTheme({
    required this.color,
    required this.textColor,
    required this.loaderColor,
    required this.disabledColor,
    this.borderColor,
    this.splashColor,
    this.disabledBorderColor,
    this.disabledTextColor,
    this.loadingColor,
    this.loadingBorderColor,
    this.loadingTextColor,
  });
}

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final bool loading;
  final bool disabled;
  final EdgeInsets? margin;
  final void Function()? onTap;
  final PrimaryButtonTheme? theme;

  const PrimaryButton({
    super.key,
    this.theme,
    this.onTap,
    this.margin,
    this.icon,
    this.text,
    this.loading = false,
    this.disabled = false,
  });

  static PrimaryButtonTheme get defaultTheme => PrimaryButtonTheme(
        color: AppTheme.colors.primaryColor,
        splashColor: Colors.deepOrange,
        textColor: AppTheme.colors.primaryBgColor,
        loaderColor: AppTheme.colors.primaryColor,
        disabledColor: AppTheme.colors.primaryColor.withOpacity(.7),
        disabledTextColor: const Color.fromRGBO(211, 211, 211, 1),
      );

  static PrimaryButtonTheme get outlinedTheme => PrimaryButtonTheme(
        color: Colors.transparent,
        loadingColor: Colors.transparent,
        disabledColor: Colors.transparent,
        textColor: AppTheme.colors.primaryTextColor,
        loaderColor: AppTheme.colors.primaryTextColor,
        borderColor: AppTheme.colors.primaryTextColor,
        loadingTextColor: AppTheme.colors.primaryTextColor,
        loadingBorderColor: AppTheme.colors.primaryTextColor,
        disabledTextColor: const Color.fromRGBO(92, 94, 100, 1),
        disabledBorderColor: const Color.fromRGBO(133, 140, 159, 1),
      );

  PrimaryButtonTheme get _theme => theme ?? defaultTheme;

  Color? get _textColor {
    if (loading) return _theme.loadingTextColor;
    if (disabled) return _theme.disabledTextColor;
    return _theme.textColor;
  }

  Color? get _borderColor {
    if (loading) return _theme.loadingBorderColor;
    if (disabled) return _theme.disabledBorderColor;

    return _theme.borderColor;
  }

  Color? get _color {
    if (loading) return _theme.loadingColor;
    if (disabled) return _theme.disabledColor;

    return _theme.color;
  }

  Widget _buildLoader() {
    return Positioned.fill(
      child: Align(
        alignment: const Alignment(.78, 0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(animation),
            child: child,
          ),
          child: loading
              ? SizedBox(
                  key: const Key('LoadingSizedBox'),
                  width: loading ? 20 : 0,
                  height: loading ? 20 : 0,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: loading
                        ? _theme.loaderColor.withOpacity(.3)
                        : _theme.loaderColor,
                  ),
                )
              : const SizedBox(key: Key('SizedBox')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(30);

    return AnimatedContainer(
      height: 52,
      width: double.infinity,
      margin: margin ?? EdgeInsets.zero,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: radius,
        border: _borderColor == null
            ? null
            : Border.all(color: _borderColor ?? Colors.transparent),
      ),
      child: MaterialInkWell(
        borderRadius: radius,
        splashColor: _theme.splashColor,
        onTap: disabled || loading ? null : onTap,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                Center(
                  child: Text(
                    text ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: _textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _buildLoader(),
          ],
        ),
      ),
    );
  }
}
