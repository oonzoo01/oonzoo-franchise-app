import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:salesapp/constant/colors/colors.dart';
import 'package:salesapp/constant/responsive.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixImage;
  final IconData? prefixIcon;
  final double prefixSize;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;
  final bool showBorder;
  final double iconSize;
  final bool divider;
  final bool isPhone;
  final String? countryDialCode;
  final Function(CountryCode countryCode)? onCountryChanged;
  final bool isRequired;
  String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    this.titleText = 'Write something...',
    this.hintText = '',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixImage,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.prefixSize = 10,
    this.textAlign = TextAlign.start,
    this.isAmount = false,
    this.isNumber = false,
    this.showTitle = false,
    this.showBorder = true,
    this.iconSize = 18,
    this.divider = false,
    this.isPhone = false,
    this.countryDialCode,
    this.onCountryChanged,
    this.isRequired = false,
    this.validator,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Text(
                widget.titleText,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              )
            : const SizedBox(),
        SizedBox(
            height: widget.showTitle
                ? Responsive.isDesktop(context)
                    ? 10
                    : 6
                : 0),
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: const TextStyle(fontSize: 16, color: kblack),
          textInputAction: widget.inputAction,
          keyboardType:
              widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          validator: widget.validator,
          obscureText: widget.isPassword ? _obscureText : false,
          // inputFormatters: widget.inputType == TextInputType.phone
          //     ? <TextInputFormatter>[
          //         FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          //       ]
          //     : widget.isAmount
          //         ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
          //         : widget.isNumber
          //             ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))]
          //             : null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                style: widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                width: 0.3,
                color: kwhite,
                //  Theme.of(context).primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                style: widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                width: 1,
                // color: Theme.of(context).primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  style:
                      widget.showBorder ? BorderStyle.solid : BorderStyle.none,
                  width: 0.3,
                  color: kwhite
                  //  Theme.of(context).primaryColor,
                  ),
            ),
            isDense: true,
            hintText:
                widget.hintText.isEmpty ? widget.titleText : widget.hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle: const TextStyle(fontSize: 16, color: kblack
                //  Theme.of(context).hintColor
                ),
            filled: true,
            prefixIcon: widget.isPhone
                ? SizedBox(
                    width: 95,
                    child: Row(children: [
                      Container(
                        width: 85,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 0),
                        padding: const EdgeInsets.only(left: 5),
                        child: const Center(
                          child: SizedBox(),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 2,
                        color: Theme.of(context).disabledColor,
                      )
                    ]),
                  )
                : widget.prefixImage != null && widget.prefixIcon == null
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widget.prefixSize),
                        child: Image.asset(widget.prefixImage!,
                            height: 20, width: 20),
                      )
                    : widget.prefixImage == null && widget.prefixIcon != null
                        ? Icon(
                            widget.prefixIcon,
                            size: widget.iconSize,
                            color: lightOrange,
                          )
                        : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : null,
          ),
          onSaved: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged as void Function(String)?,
        ),
        widget.divider
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              )
            : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
