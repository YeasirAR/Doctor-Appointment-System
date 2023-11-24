class AppointDoctor {
  final String name;
  final String specialty;
  final double fee;

  AppointDoctor({
    required this.name,
    required this.specialty,
    required this.fee,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'fee': fee,
    };
  }

  factory AppointDoctor.fromJson(Map<String, dynamic> json) {
    return AppointDoctor(
      name: json['name'],
      specialty: json['specialty'],
      fee: json['fee'],
    );
  }
}
