String getImageUrl(
  String id, {
  bool retrie = false,
}) {
  final base = 'https://cdn2.thecatapi.com/images/$id';
  if (retrie) {
    return '$base.png';
  }
  return '$base.jpg';
}
