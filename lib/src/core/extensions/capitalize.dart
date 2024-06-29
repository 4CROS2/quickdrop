extension Capitalize on String {
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    // Divide la cadena en palabras y capitaliza la primera letra de cada una.
    return split(' ').map((String word) {
      if (word.isEmpty) {
        return '';
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
