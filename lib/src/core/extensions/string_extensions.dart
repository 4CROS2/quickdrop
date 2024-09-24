extension StringExtensions on String {
  String toTitleCase() {
    return split(' ').map((String word) {
      if (word.isEmpty) {
        return word;
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

 String capitalize() {
    if (isEmpty) {
      return '';
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
