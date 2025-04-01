List<String> generateNgrams(String text, int n) {
  final List<String> ngrams = <String>[];
  final String cleanText = text.toLowerCase(); // Normalizamos a minúsculas
  for (int i = 0; i <= cleanText.length - n; i++) {
    ngrams.add(cleanText.substring(i, i + n));
  }
  return ngrams;
}
