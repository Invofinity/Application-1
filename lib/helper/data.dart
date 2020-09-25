import 'package:News_App/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "cricket";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=755&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "GlobalNews";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1521295121783-8a321d551ad2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "health";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1447452001602-7090c7ab2db3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "science";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "sports";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "technology";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1538491247542-5da27794bc65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60";
  category.add(categoryModel);

  return category;
}
