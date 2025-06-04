class Task {
  final String id;
  final String name;
  final bool completed;
  final DateTime date;

  Task({
    required this.id,
    required this.name,
    required this.completed,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'completed': completed,
      'date': date.toIso8601String(),
    };
  }

  factory Task.fromMap(String id, Map<String, dynamic> map) {
    return Task(
      id: id,
      name: map['name'] ?? '',
      completed: map['completed'] ?? false,
      date: DateTime.parse(map['date']),
    );
  }
}
