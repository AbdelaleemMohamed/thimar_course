class MyCategory {
  late int id;
  late int ?color;

  late String name, image;

  MyCategory({
    required this.id,
    this.color,
    required this.name,
    required this.image,
  });
}
