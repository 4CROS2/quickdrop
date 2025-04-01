import 'package:flutter/material.dart';

List<TextSpan> highlightOccurrences(String source, String query) {
  if (query.isEmpty || !source.toLowerCase().contains(query.toLowerCase())) {
    return <TextSpan>[TextSpan(text: source)];
  }

  final Iterable<Match> matches =
      query.toLowerCase().allMatches(source.toLowerCase());
  int lastMatchEnd = 0;
  final List<TextSpan> children = <TextSpan>[];

  for (final Match match in matches) {
    if (match.start != lastMatchEnd) {
      children.add(TextSpan(text: source.substring(lastMatchEnd, match.start)));
    }
    children.add(TextSpan(
      text: source.substring(match.start, match.end),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ));
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd != source.length) {
    children.add(TextSpan(text: source.substring(lastMatchEnd)));
  }

  return children;
}
