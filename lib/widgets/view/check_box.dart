import 'package:flutter/material.dart';
import '../../colors.dart';

class CheckBoxControl extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  final String title;

  const CheckBoxControl({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  _CheckBoxControlState createState() => _CheckBoxControlState();
}

class _CheckBoxControlState extends State<CheckBoxControl> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isChecked);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorButton,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: colorGreen,
              blurRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isChecked ? colorGreen : colorTransparent,
                border: Border.all(
                  color: widget.isChecked ? colorTransparent : colorGreen,
                  width: 2,
                ),
              ),
              child: widget.isChecked
                  ? const Icon(
                      Icons.check,
                      color: colorWhite,
                      size: 16,
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
