/*
class Worker {
  String id;
  String name;
  String address;
  String birthday;
  String accountdetails;
  String svnumber;

  Worker(this.id, this.name, this.address, this.birthday, this.accountdetails,
      this.svnumber);
} */

class Worker {
  final String id;
  final String name;
  final String position;

  Worker({
    required this.id,
    required this.name,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "position": position,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(id: map["id"], name: map["name"], position: map["position"]);
  }

  factory Worker.eigtheen(String id, String name, String position) {
    return Worker(id: id, name: name, position: position);
  }
}
