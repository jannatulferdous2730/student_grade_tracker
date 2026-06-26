class Subject {
  final String name;
  final int _mark;

  Subject({
    required this.name,
    required this._mark,
  });

  int get mark => _mark;

  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mark': _mark,
    };
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'] as String,
      mark: json['mark'] as int,
    );
  }
}
