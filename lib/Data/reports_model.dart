class ReportsResponse {
  final List<ReportItem> pending;
  final List<ReportItem> resolved;

  ReportsResponse({required this.pending, required this.resolved});

  /// ---------- GETTERS ----------
  int get totalReports => pending.length + resolved.length;

  int get pendingCount => pending.length;

  int get resolvedCount => resolved.length;

  int get inProgressCount => pending
      .where((report) => report.status.toLowerCase() == 'in progress')
      .length;

  /// ---------- FROM JSON ----------
  factory ReportsResponse.fromJson(Map<String, dynamic> json) {
    return ReportsResponse(
      pending: (json['pending'] as List)
          .map((item) => ReportItem.fromJson(item))
          .toList(),
      resolved: (json['resolved'] as List)
          .map((item) => ReportItem.fromJson(item))
          .toList(),
    );
  }
}

class ReportItem {
  final int id;
  final int userId;
  final int hospitalId;
  final String? title;
  final String category;
  final String description;
  final String status;
  final String attachmentUrl;
  final String department;
  final String? jobTitle;
  final DateTime createdAt;
  final DateTime? resolvedAt;

  ReportItem({
    required this.id,
    required this.userId,
    required this.hospitalId,
    required this.title,
    required this.category,
    required this.description,
    required this.status,
    required this.attachmentUrl,
    required this.department,
    required this.jobTitle,
    required this.createdAt,
    required this.resolvedAt,
  });

  factory ReportItem.fromJson(Map<String, dynamic> json) {
    return ReportItem(
      id: json['id'],
      userId: json['userId'],
      hospitalId: json['hospitalId'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      status: json['status'],
      attachmentUrl: json['attachmentUrl'],
      department: json['department'],
      jobTitle: json['job_title'],
      createdAt: DateTime.parse(json['createdAt']),
      resolvedAt: json['resolvedAt'] != null
          ? DateTime.parse(json['resolvedAt'])
          : null,
    );
  }
}
