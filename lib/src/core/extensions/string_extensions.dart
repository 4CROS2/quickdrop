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

  String capitalizeSentences() {
    if (isEmpty) {
      return '';
    }
    List<String> sentences = split('. ');
    for (int i = 0; i < sentences.length; i++) {
      if (sentences[i].isNotEmpty) {
        sentences[i] = sentences[i][0].toUpperCase() +
            sentences[i].substring(1).toLowerCase();
      }
    }
    return sentences.join('. ');
  }
}
