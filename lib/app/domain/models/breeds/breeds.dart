import 'package:freezed_annotation/freezed_annotation.dart';

part 'breeds.freezed.dart';
part 'breeds.g.dart';

@freezed
class Breeds with _$Breeds {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Breeds({
    required Weight weight,
    required String id,
    required String name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    required String temperament,
    required String origin,
    required String countryCodes,
    required String countryCode,
    required String description,
    required String lifeSpan,
    required int indoor,
    int? lap,
    String? altNames,
    required int adaptability,
    required int affectionLevel,
    required int childFriendly,
    required int dogFriendly,
    required int energyLevel,
    required int grooming,
    required int healthIssues,
    required int intelligence,
    required int sheddingLevel,
    required int socialNeeds,
    required int strangerFriendly,
    required int vocalisation,
    required int experimental,
    required int hairless,
    required int natural,
    required int rare,
    required int rex,
    required int suppressedTail,
    required int shortLegs,
    String? wikipediaUrl,
    required int hypoallergenic,
    String? referenceImageId,
  }) = _Breeds;

  factory Breeds.fromJson(Map<String, dynamic> json) => _$BreedsFromJson(json);
}

@freezed
class Weight with _$Weight {
  const factory Weight({
    required String imperial,
    required String metric,
  }) = _Weight;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
