import 'package:json_annotation/json_annotation.dart';
part 'pagination.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Pagination {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final Items items;

  bool get canLoadNextPage => hasNextPage;

  int get totalPages => lastVisiblePage;

  bool get isLastPage => currentPage >= lastVisiblePage;

  Pagination(
      {required this.lastVisiblePage,
      required this.hasNextPage,
      required this.currentPage,
      required this.items});
  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Items {
  final int count;
  final int total;
  final int perPage;

  Items({required this.count, required this.total, required this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
