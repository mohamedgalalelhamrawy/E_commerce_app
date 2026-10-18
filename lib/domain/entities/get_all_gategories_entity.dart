class GetAllGategoriesOrBrandsEntity {
  final int? results;
  final List<CategoryOrBrandResponseEntity>? data;
  final String? message;
  final String? statusMsg;

  GetAllGategoriesOrBrandsEntity({
     this.results,
     this.data,
     this.message,
     this.statusMsg,
  });
}

class CategoryOrBrandResponseEntity {
  final String? id;
  final String? name;
  final String? image;

  CategoryOrBrandResponseEntity({
     this.id,
     this.name,
     this.image,
  });
}
