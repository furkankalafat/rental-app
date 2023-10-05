abstract class BaseModel {
  Map<String, dynamic> toJson();

  static T? fromJson<T extends BaseModel>(dynamic map) {
    switch (T) {
      case BaseModel:
        return null;
      default:
        final err = "PLEASE ADD fromJson case for $T in BaseModel class";
        throw UnimplementedError(err);
    }
  }
}
