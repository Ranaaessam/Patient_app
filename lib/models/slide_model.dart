class Slide_model {
  final String imageUrl;
  final String title;

  Slide_model({
    required this.imageUrl,
    required this.title,
  });
}

final slideList_model = [
  Slide_model(
    imageUrl: 'assets/images/oralcancer.png',
    title: 'Oral Cancer',
  ),
];
