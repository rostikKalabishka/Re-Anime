// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeEntity _$AnimeEntityFromJson(Map<String, dynamic> json) => AnimeEntity(
      malId: (json['mal_id'] as num?)?.toInt(),
      url: json['url'] as String?,
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      producers: (json['producers'] as List<dynamic>?)
          ?.map((e) => Producers.fromJson(e as Map<String, dynamic>))
          .toList(),
      trailer: json['trailer'] == null
          ? null
          : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      approved: json['approved'] as bool?,
      titles: (json['titles'] as List<dynamic>?)
          ?.map((e) => Titles.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      titleEnglish: json['title_english'] as String?,
      titleJapanese: json['title_japanese'] as String?,
      titleSynonyms: (json['title_synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      type: json['type'] as String?,
      source: json['source'] as String?,
      episodes: (json['episodes'] as num?)?.toInt(),
      status: json['status'] as String?,
      airing: json['airing'] as bool?,
      aired: json['aired'] == null
          ? null
          : Aired.fromJson(json['aired'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      scoredBy: (json['scored_by'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toInt(),
      members: (json['members'] as num?)?.toInt(),
      favorites: (json['favorites'] as num?)?.toInt(),
      synopsis: json['synopsis'] as String?,
      background: json['background'] as String?,
      season: json['season'] as String?,
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AnimeEntityToJson(AnimeEntity instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': instance.images?.toJson(),
      'trailer': instance.trailer?.toJson(),
      'approved': instance.approved,
      'titles': instance.titles?.map((e) => e.toJson()).toList(),
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_japanese': instance.titleJapanese,
      'title_synonyms': instance.titleSynonyms,
      'type': instance.type,
      'source': instance.source,
      'episodes': instance.episodes,
      'status': instance.status,
      'airing': instance.airing,
      'aired': instance.aired?.toJson(),
      'duration': instance.duration,
      'rating': instance.rating,
      'score': instance.score,
      'scored_by': instance.scoredBy,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'members': instance.members,
      'favorites': instance.favorites,
      'synopsis': instance.synopsis,
      'background': instance.background,
      'season': instance.season,
      'year': instance.year,
      'producers': instance.producers?.map((e) => e.toJson()).toList(),
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      jpg: json['jpg'] == null
          ? null
          : Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: json['webp'] == null
          ? null
          : Jpg.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

Jpg _$JpgFromJson(Map<String, dynamic> json) => Jpg(
      imageUrl: json['imageUrl'] as String?,
      smallImageUrl: json['smallImageUrl'] as String?,
      largeImageUrl: json['largeImageUrl'] as String?,
    );

Map<String, dynamic> _$JpgToJson(Jpg instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'smallImageUrl': instance.smallImageUrl,
      'largeImageUrl': instance.largeImageUrl,
    };

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      youtubeId: json['youtubeId'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embedUrl'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'youtubeId': instance.youtubeId,
      'url': instance.url,
      'embedUrl': instance.embedUrl,
    };

Titles _$TitlesFromJson(Map<String, dynamic> json) => Titles(
      type: json['type'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TitlesToJson(Titles instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
    };

Aired _$AiredFromJson(Map<String, dynamic> json) => Aired(
      from: json['from'] as String?,
      to: json['to'] as String?,
      prop: json['prop'] == null
          ? null
          : Prop.fromJson(json['prop'] as Map<String, dynamic>),
      string: json['string'] as String?,
    );

Map<String, dynamic> _$AiredToJson(Aired instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'prop': instance.prop,
      'string': instance.string,
    };

Prop _$PropFromJson(Map<String, dynamic> json) => Prop(
      from: json['from'] == null
          ? null
          : From.fromJson(json['from'] as Map<String, dynamic>),
      to: json['to'] == null
          ? null
          : From.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropToJson(Prop instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

From _$FromFromJson(Map<String, dynamic> json) => From(
      day: (json['day'] as num?)?.toInt(),
      month: (json['month'] as num?)?.toInt(),
      year: (json['year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };

Producers _$ProducersFromJson(Map<String, dynamic> json) => Producers(
      malId: (json['malId'] as num?)?.toInt(),
      type: json['type'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProducersToJson(Producers instance) => <String, dynamic>{
      'malId': instance.malId,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };
