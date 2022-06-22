abstract class ISize {
  final String imperial;
  final String? metric;

  ISize(this.imperial, this.metric);
}

class PetWeight extends ISize {
  PetWeight(String imperial, String? metric) : super(imperial, metric);
}

class PetHeight extends ISize {
  PetHeight(String imperial, String? metric) : super(imperial, metric);
}
