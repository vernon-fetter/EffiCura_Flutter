class ApiResponse<T> {
  final int count;
  final List<int> ids;
  final List<Map<String, dynamic>> result; // Updated type

  ApiResponse({
    required this.count,
    required this.ids,
    required this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      count: json['count'],
      ids: List<int>.from(json['ids']),
      result: List<Map<String, dynamic>>.from(json['result']),
    );
  }
}
