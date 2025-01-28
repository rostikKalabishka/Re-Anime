import 'package:json_annotation/json_annotation.dart';
import 'package:re_anime_app/api/models/models.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ListResponse {
  final Pagination pagination;
  final List<AnimeEntity> data;

  ListResponse({
    required this.pagination,
    required this.data,
  });
}
