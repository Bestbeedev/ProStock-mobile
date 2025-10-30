class History {
  final int id;
  final String action;
  final String? details;
  final String? ipAddress;
  final String? userAgent;
  final int userId;
  final String? date;

  History({
    required this.id,
    required this.action,
    this.details,
    this.ipAddress,
    this.userAgent,
    required this.userId,
    this.date,
      });

  factory History.fromJson(Map<String, dynamic> json) => History(
    id: json['id'],
    action: json['action'],
    details: json['details'],
    ipAddress: json['ipAddress'],
    userAgent: json['userAgent'],
    userId: json['UserId'],
    date: json['date'],
  );
}
