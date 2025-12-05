class ComplaintModel {
  final int hospitalId;
  final String title;
  final String category;
  final String department;
  final String description;
  final String jobTitle;
  final String attachmentUrl;

  ComplaintModel({
    required this.hospitalId,
    required this.title,
    required this.category,
    required this.department,
    required this.description,
    required this.jobTitle,
    required this.attachmentUrl,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      hospitalId: json['hospitalId'] ?? 0,
      title: json['title'] ?? "",
      category: json['category'] ?? "",
      department: json['department'] ?? "",
      description: json['description'] ?? "",
      jobTitle: json['job_title'] ?? "",
      attachmentUrl: json['attachmentUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hospitalId": hospitalId,
      "title": title,
      "category": category,
      "department": department,
      "description": description,
      "job_title": jobTitle,
      "attachmentUrl": attachmentUrl,
    };
  }
}
