class CategoryModel {
  final String name;
  final String icon;

  CategoryModel({
    required this.name,
    required this.icon,
  });
}

List<CategoryModel> categories = [

  CategoryModel(
    name: "Food",
    icon: "🍔",
  ),

  CategoryModel(
    name: "Travel",
    icon: "🚗",
  ),

  CategoryModel(
    name: "Shopping",
    icon: "🛍",
  ),

  CategoryModel(
    name: "Bills",
    icon: "💡",
  ),

  CategoryModel(
    name: "Health",
    icon: "🏥",
  ),

  CategoryModel(
    name: "Others",
    icon: "📌",
  ),

];