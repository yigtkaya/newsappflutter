extension StringExtensions on String? {
  String capitalizeFirstLetter() {
    if (this == null || this!.isEmpty) {
      return '';
    }
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }
}
