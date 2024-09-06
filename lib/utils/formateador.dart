import 'package:flutter/services.dart';

// Formateador de entrada personalizado para aceptar solo 3 dígitos
class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.length <= 2) {
      // Si la entrada es de 1 o 2 dígitos, tratarla como un entero
      return newValue;
    } else if (newText.length == 3) {
      // Si la entrada es de 3 dígitos, tratar los dos primeros como enteros y el último como decimal
      String integerPart = newText.substring(0, 2);
      String decimalPart = newText.substring(2);
      String formattedText = '$integerPart.$decimalPart';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else {
      // Si la entrada excede 3 dígitos, ignorar la entrada adicional
      return oldValue;
    }
  }
}