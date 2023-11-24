class Doctor {
  final String name;
  final String specialty;
  final String image;
  final String S_About;
  final String Phone;
  final String L_About;
  final String Spe_about;
  final String Patients;
  final String Experiences;
  final String Review;
  final String Location;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    required this.S_About,
    required this.Phone,
    required this.L_About,
    required this.Spe_about,
    required this.Patients,
    required this.Experiences,
    required this.Review,
    required this.Location,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'image': image,
      'S_About': S_About,
      'Phone': Phone,
      'L_About': L_About,
      'Spe_about': Spe_about,
      'Patients': Patients,
      'Experiences': Experiences,
      'Review': Review,
      'Location': Location,
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      image: json['image'],
      S_About: json['S_About'],
      Phone: json['Phone'],
      L_About: json['L_About'],
      Spe_about: json['Spe_about'],
      Patients: json['Patients'],
      Experiences: json['Experiences'],
      Review: json['Review'],
      Location: json['Location'],
    );
  }
}
