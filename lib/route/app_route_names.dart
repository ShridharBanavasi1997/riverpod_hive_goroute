enum AppRouth{
  editIcon._(routeName:"Edit-Icon",routePath:"/"),
  selectIcon._(routeName:"Select-Icon",routePath:"/select_path");

  const AppRouth._({required this.routeName, required this.routePath});
  final String routeName;
  final String routePath;
}