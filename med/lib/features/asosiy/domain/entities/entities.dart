// ignore_for_file: public_member_api_docs, sort_constructors_first

class MaqolaEntities {
  final String id;
   final String title;
  final String description;
  final DateTime data;
  final String image;
  final String export;
  final String avtor;
  final bool isSave;
  MaqolaEntities({
    required this.id,
    required this.title,
    required this.description,
    required this.data,
    required this.image,
    required this.export,
    required this.avtor,
    required this.isSave,
  });
  

  @override
  String toString() {
    return 'MaqolaEntities(title: $title, description: $description, data: $data, image: $image, export: $export, avtor: $avtor, isSave: $isSave)';
  }
}
