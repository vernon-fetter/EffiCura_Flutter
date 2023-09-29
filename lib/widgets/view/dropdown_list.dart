import 'package:flutter/material.dart';
import '../../colors.dart';

class DropdownListControl<T> extends StatefulWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final Function(T?) onChanged;
  final bool isBusy;

  const DropdownListControl({
    Key? key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.isBusy,
  }) : super(key: key);

  @override
  _DropdownListControlState<T> createState() => _DropdownListControlState<T>();
}

class _DropdownListControlState<T> extends State<DropdownListControl<T>> {
  @override
  Widget build(BuildContext context) {
    double borderRadius = 5.0;

    return Container(
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: colorGreen,
            blurRadius: 3,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: widget.isBusy
          ? const Center(
              child: SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            )
          : DropdownButton<T>(
              isExpanded: true,
              value: widget.value,
              items: widget.items,
              onChanged: widget.onChanged,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: colorGreen,
              ),
              underline: Container(), // Remove the default underline
              elevation: 0, // Remove the default dropdown elevation
            ),
    );
  }
}
