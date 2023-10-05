class User {
  final String id;
  final String email;
  final DateTime created;
  late String fullName;
  late String profileURL;
  late Map<String, String> contacts;
  late Map<String, dynamic> location;
  late Map<String, dynamic> settings;

  User(this.id, this.email, this.created) {
    contacts = {};
    location = {
      'useLocation': false,
      'coords': '',
    };
    settings = {
      'useDarkMode': false,
      'accentColor': '',
    };
  }
}
