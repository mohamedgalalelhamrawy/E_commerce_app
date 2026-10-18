import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';

class GetAllGategoriesOrBrandsResponseDto {
  final int? results;
  final List<CategoryOrBrandResponseDto>? data;
  final String? message;
  final String? statusMsg;

  GetAllGategoriesOrBrandsResponseDto({
     this.results,
     this.data,
    this.message,
    this.statusMsg,
  });

  factory GetAllGategoriesOrBrandsResponseDto.fromJson(Map<String, dynamic> json) =>
      GetAllGategoriesOrBrandsResponseDto(
        statusMsg: json["statusMsg"],
        message: json["message"],
        results: json["results"],
        data: json["data"] != null
            ? List<CategoryOrBrandResponseDto>.from(
                (json["data"] as List)
                    .map((x) => CategoryOrBrandResponseDto.fromJson(x)),
              )
            : null,
      );

  GetAllGategoriesOrBrandsEntity toEntity() {
    return GetAllGategoriesOrBrandsEntity(
        results: results,
        data: data?.map((categoryDto) => categoryDto.toEntity()).toList(),
        message: message,
        statusMsg: statusMsg);
  }
}

class CategoryOrBrandResponseDto {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryOrBrandResponseDto({
     this.id,
     this.name,
     this.slug,
     this.image,
     this.createdAt,
     this.updatedAt,
  });

  factory CategoryOrBrandResponseDto.fromJson(Map<String, dynamic> json) =>
      CategoryOrBrandResponseDto(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
      );

  CategoryOrBrandResponseEntity toEntity() {
    return CategoryOrBrandResponseEntity(id: id, name: name, image: image);
  }
}
