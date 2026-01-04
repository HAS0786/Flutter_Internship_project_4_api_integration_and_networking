// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

// this is used to convert JSON to Dart (as flutter works with Dart not JSON directly) we say this JSON parsing
import 'dart:convert';

// convert JSON into List
// userDataFromJson (is a function name defined by me)
List<UserData> userDataFromJson(
  String str,
) => // it return a list of Data in Dart code as after calling Factory constructor
List<UserData>.from(
  json.decode(str).map((x) => UserData.fromJson(x)),
); // UserData.fromJson is my own function (fromJson is a function define below)

// need when sending data to API in JSON foramt::
// String userDataToJson(List<UserData> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Model (it's same name-variable as in JSON data)
class UserData {
  int id;
  String name;
  String username;
  String email;
  // Address address;
  String phone;
  String website;
  // Company company;

  // constructor:
  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    // required this.address,
    required this.phone,
    required this.website,
    // required this.company,
  });

  // when we want to do some work before making object we use Factory constructor instead of simple one
  // (as that make object instantly) , we use this as it take data from JSON format and then map to Dart
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(  // fromJson is a function-name that return UserData-model like Data:
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    // address: Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    // company: Company.fromJson(json["company"]),
  );

  // // to Json (need when sending data)
  //   Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "username": username,
  //     "email": email,
  //     // "address": address.toJson(),
  //     "phone": phone,
  //     "website": website,
  //     // "company": company.toJson(),
  //   };
  // }

  // no needed now (as these require extra data so we make classes for this:
  // class Address {
  //   String street;
  //   String suite;
  //   String city;
  //   String zipcode;
  //   Geo geo;
  //
  //   Address({
  //     required this.street,
  //     required this.suite,
  //     required this.city,
  //     required this.zipcode,
  //     required this.geo,
  //   });

  //   factory Address.fromJson(Map<String, dynamic> json) => Address(
  //     street: json["street"],
  //     suite: json["suite"],
  //     city: json["city"],
  //     zipcode: json["zipcode"],
  //     geo: Geo.fromJson(json["geo"]),
  //   );
  //
  //   Map<String, dynamic> toJson() => {
  //     "street": street,
  //     "suite": suite,
  //     "city": city,
  //     "zipcode": zipcode,
  //     "geo": geo.toJson(),
  //   };
  // }
  //
  // class Geo {
  //   String lat;
  //   String lng;
  //
  //   Geo({required this.lat, required this.lng});
  //
  //   factory Geo.fromJson(Map<String, dynamic> json) =>
  //       Geo(lat: json["lat"], lng: json["lng"]);
  //
  //   Map<String, dynamic> toJson() => {"lat": lat, "lng": lng};
  // }
  //
  // class Company {
  //   String name;
  //   String catchPhrase;
  //   String bs;
  //
  //   Company({required this.name, required this.catchPhrase, required this.bs});
  //
  //   factory Company.fromJson(Map<String, dynamic> json) => Company(
  //     name: json["name"],
  //     catchPhrase: json["catchPhrase"],
  //     bs: json["bs"],
  //   );
  //
  //   Map<String, dynamic> toJson() => {
  //     "name": name,
  //     "catchPhrase": catchPhrase,
  //     "bs": bs,
  //   };
  // }
}
