class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? parentCategoriesId;
  String? categoriesImage;
  String? categoriesCreate;
  String? categoriesNp;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.parentCategoriesId,
      this.categoriesImage,
      this.categoriesCreate,
      this.categoriesNp});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    parentCategoriesId = json['parent_categories_id'];
    categoriesImage = json['categories_image'];
    categoriesCreate = json['categories_create'];
    categoriesNp = json['categories_np'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['parent_categories_id'] = parentCategoriesId;
    data['categories_image'] = categoriesImage;
    data['categories_create'] = categoriesCreate;
    data['categories_np'] = categoriesNp;
    return data;
  }
}
