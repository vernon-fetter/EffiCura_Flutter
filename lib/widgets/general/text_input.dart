import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors.dart';

enum TextInputControlType {
  text,
  password,
  phone,
  numbers,
  multiline,
  textPlain,
  textBold,
  textPlainUnderline,
  grey,
  greyNumbers,
  textOnly
}

class TextInputControl extends StatefulWidget {
  final String? placeholder;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputControlType? type;
  final ValueChanged<String> onChange;
  final ValueChanged<bool>? onFocusChanged;
  final bool? enabled;
  final TextInputType? keyboardType;
  final int? maxLines;

  const TextInputControl({
    Key? key,
    this.placeholder,
    this.maxLength,
    this.controller,
    this.type,
    required this.onChange,
    this.onFocusChanged,
    this.enabled,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  _TextInputControlState createState() => _TextInputControlState();
}

class _TextInputControlState extends State<TextInputControl> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool isObscure = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      init();
    });
    super.initState();
  }

  init() {
    _focus.addListener(_onFocusChange);

    if (widget.controller == null) {
      // _controller = TextEditingController();
      _controller.addListener(_onTextChange);
    } else {
      // _controller = widget.controller;
      widget.controller!.addListener(_onTextChange);
    }
    // _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    super.dispose();

    _focus.removeListener(_onFocusChange);
    // _controller.removeListener(_onTextChange);

    if (widget.controller == null) {
      _controller.removeListener(_onTextChange);
    } else {
      widget.controller!.removeListener(_onTextChange);
    }
  }

  _onTextChange() {
    // widget.onChange(_controller.text);
    if (widget.controller == null) {
      widget.onChange(_controller.text);
    } else {
      widget.onChange(widget.controller!.text);
    }
  }

  _onFocusChange() {
    if (widget.onFocusChanged != null) {
      widget.onFocusChanged!(_focus.hasFocus);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case TextInputControlType.password:
        return Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller ?? _controller,
                maxLength: widget.maxLength,
                // keyboardType: widget.keyboardType,
                // maxLines: widget.maxLines,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                focusNode: _focus,
                obscureText: isObscure,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorWhite,
                  fontSize: 16,
                ),
                enabled: widget.enabled,
                decoration: InputDecoration(
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: colorWhite, width: 1),
                  // ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorWhite, width: 1),
                  ),
                  labelText: widget.placeholder,
                  labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
                  contentPadding: const EdgeInsets.all(3),
                  counterText: "",
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: colorWhite,
                size: 16,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ],
        );
      case TextInputControlType.phone:
        return TextField(
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          keyboardType: TextInputType.phone,
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.numbers:
        return TextField(
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.multiline:
        return TextField(
          cursorColor: colorWhite,
          keyboardType: widget.keyboardType,
          minLines: 5,
          maxLines: widget.maxLines,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),

          // decoration: InputDecoration(
          //   focusedBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: colorWhite, width: 1),
          //   ),
          //   labelText: widget.placeholder,
          //   labelStyle: TextStyle(color: colorWhite, fontSize: 16),
          //   contentPadding: EdgeInsets.all(3),
          //   counterText: "",
          // ),
        );
      case TextInputControlType.textPlain:
        return TextField(
          cursorColor: colorWhite,
          keyboardType: widget.keyboardType,
          minLines: 1,
          maxLines: widget.maxLines,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorTransparent, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.textPlainUnderline:
        return TextField(
          cursorColor: colorWhite,
          keyboardType: widget.keyboardType,
          minLines: 1,
          maxLines: widget.maxLines,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),
          // decoration: InputDecoration(
          //   focusedBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: colorTransparent, width: 1),
          //   ),
          //   labelText: widget.placeholder,
          //   labelStyle: TextStyle(color: colorWhite, fontSize: 16),
          //   contentPadding: EdgeInsets.all(3),
          //   counterText: "",
          // ),
        );
      case TextInputControlType.textBold:
        return TextField(
          cursorColor: colorWhite,
          keyboardType: widget.keyboardType,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.grey:
        return TextField(
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorGrey, fontSize: 20),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.greyNumbers:
        return TextField(
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorGrey, fontSize: 20),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.textOnly:
        return TextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow((RegExp("[A-Za-z]"))),
          ],
          keyboardType: TextInputType.name,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
      case TextInputControlType.text:
      default:
        return TextField(
          keyboardType: TextInputType.name,
          controller: widget.controller ?? _controller,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          focusNode: _focus,
          style: const TextStyle(
            color: colorWhite,
            fontSize: 16,
          ),
          enabled: widget.enabled,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: colorWhite, width: 1),
            ),
            labelText: widget.placeholder,
            labelStyle: const TextStyle(color: colorWhite, fontSize: 16),
            contentPadding: const EdgeInsets.all(3),
            counterText: "",
          ),
        );
    }
  }
}
