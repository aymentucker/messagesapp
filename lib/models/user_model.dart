class UserData {
  final String
      id; // Consider having an ID if you're storing individual user records
  final String email;
  final String? phone;
  final String? imgProfileUrl;
  final String? userType;

  UserData({
    required this.id,
    required this.email,
    this.phone,
    this.imgProfileUrl,
    this.userType,
  });

  // Convert a UserData instance into a Map. Useful for uploading data to Firestore.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'imgProfileUrl': imgProfileUrl,
      'userType': userType,
    };
  }

  // Construct a UserData instance from a map. Useful for fetching data from Firestore.
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
      imgProfileUrl: map['imgProfileUrl'],
      userType: map['userType'],
    );
  }
}
