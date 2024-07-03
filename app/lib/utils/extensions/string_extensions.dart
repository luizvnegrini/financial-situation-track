extension StringExtensions on String {
  num get asNum {
    final value = replaceAll(',', '').replaceAll('.', '');
    return num.parse(value);
  }
}
