class HospitalModel {
  final int id;
  final String name;
  final String location;

  HospitalModel({required this.id, required this.name, required this.location});

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'location': location};
  }

  /// Parse list of hospitals from API response
  static List<HospitalModel> fromList(List<dynamic> list) {
    return list.map((item) => HospitalModel.fromJson(item)).toList();
  }
}
