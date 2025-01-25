import 'package:json_annotation/json_annotation.dart';

part 'anime.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
@JsonSerializable()
class AnimeEntity {
  final int? malId;
  final String? url;
  final Images? images;
  final Trailer? trailer;
  final bool? approved;
  final List<Titles>? titles;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String>? titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;

  final List<Producers>? producers;
  // final List<Licensors>? licensors;
  // final List<Studios>? studios;
  // final List<Genres>? genres;

  const AnimeEntity(
      {required this.malId,
      required this.url,
      required this.images,
      required this.producers,
      required this.trailer,
      required this.approved,
      required this.titles,
      required this.title,
      required this.titleEnglish,
      required this.titleJapanese,
      required this.titleSynonyms,
      required this.type,
      required this.source,
      required this.episodes,
      required this.status,
      required this.airing,
      required this.aired,
      required this.duration,
      required this.rating,
      required this.score,
      required this.scoredBy,
      required this.rank,
      required this.popularity,
      required this.members,
      required this.favorites,
      required this.synopsis,
      required this.background,
      required this.season,
      required this.year});

  factory AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$AnimeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeEntityToJson(this);
}

@JsonSerializable()
class Images {
  final Jpg? jpg;
  final Jpg? webp;

  const Images({this.jpg, this.webp});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class Jpg {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  const Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) => _$JpgFromJson(json);

  Map<String, dynamic> toJson() => _$JpgToJson(this);
}

@JsonSerializable()
class Trailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;

  const Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Titles {
  final String? type;
  final String? title;

  const Titles({this.type, this.title});

  factory Titles.fromJson(Map<String, dynamic> json) => _$TitlesFromJson(json);

  Map<String, dynamic> toJson() => _$TitlesToJson(this);
}

@JsonSerializable()
class Aired {
  final String? from;
  final String? to;
  final Prop? prop;
  final String? string;

  const Aired({this.from, this.to, this.prop, this.string});

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

  Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Prop {
  final From? from;
  final From? to;

  const Prop({this.from, this.to});

  factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

  Map<String, dynamic> toJson() => _$PropToJson(this);
}

@JsonSerializable()
class From {
  final int? day;
  final int? month;
  final int? year;

  const From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

  Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class Producers {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  const Producers({this.malId, this.type, this.name, this.url});

  factory Producers.fromJson(Map<String, dynamic> json) =>
      _$ProducersFromJson(json);

  Map<String, dynamic> toJson() => _$ProducersToJson(this);
}
