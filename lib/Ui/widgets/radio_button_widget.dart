import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton({
    super.key,
    required this.selectedValue,
    required this.value,
  });

  String? selectedValue;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff79747E), // change color when selected
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$value', style: const TextStyle(fontSize: 16)),
          Icon(
            selectedValue == '$value'
                ? Icons.radio_button_checked
                : Icons.radio_button_off, // or Icons.radio_button_off
            color: selectedValue == '$value'
                ? Color(0xff4f5efa)
                : Color(0xff49454F),
          ),
        ],
      ),
    );
  }
}
