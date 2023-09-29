import 'package:flutter/material.dart';

import '../../colors.dart';

class DateTimePickerControl extends StatelessWidget {
  final String label;
  final DateTime? selectedDateTime;
  final Function(DateTime) onDateTimeSelected;

  const DateTimePickerControl({
    Key? key,
    required this.label,
    required this.selectedDateTime,
    required this.onDateTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 5.0;

    return GestureDetector(
      onTap: () {
        _showDateTimePicker(context);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 130, minHeight: 50),
        child: Container(
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: colorGreen,
                blurRadius: 3,
              )
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorWhite,
                ),
              ),
              Text(
                selectedDateTime != null
                    ? "${selectedDateTime!.toLocal()}".split(' ')[0] +
                        " " +
                        " ${selectedDateTime!.toLocal()}".split(' ')[2]
                    : 'Select Date & Time',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: colorWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        onDateTimeSelected(combinedDateTime);
      }
    }
  }
}
