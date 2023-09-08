// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListTileModel {
  final String title;
  final String subtitle;
  final String icon;
  ListTileModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

final listTileModels = [
  ListTileModel(
    icon: 'assets/svg/happy.svg',
    title: 'Удобства',
    subtitle: 'Самое необходимое',
  ),
  ListTileModel(
    icon: 'assets/svg/checkmark.svg',
    title: 'Что включено',
    subtitle: 'Самое необходимое',
  ),
  ListTileModel(
    icon: 'assets/svg/close.svg',
    title: 'Что не включено',
    subtitle: 'Самое необходимое',
  ),
];
