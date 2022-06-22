abstract class IPet {
  final String id;
  final String? name;
  final String breedName;
  final String image;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final int weight;

  IPet(
      {required this.id,
      this.name,
      required this.breedName,
      required this.image,
      required this.temperament,
      required this.origin,
      required this.lifeSpan,
      required this.weight});
}
