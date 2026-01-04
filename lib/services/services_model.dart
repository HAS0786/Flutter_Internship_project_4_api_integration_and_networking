import 'package:api_integration_and_networking/models/userdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class RemoteServices{
  Future<List<UserData>?> getData() async{  // getData is a function that is Called from where data is required it then call the API
    // then take data and send to userdata.dart that parse from JSON to dart then we display that data in screen:
    var Client = http.Client(); // we build a http connection:
  try{
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");  // it is used to parse the URL:
    var response = await Client.get(uri); // response from connection (on URL provided)
    if(response.statusCode==200){ // if URL works and make a connection
      var json = response.body; // we take a data from URL website
      return userDataFromJson(json); // now send it to userdata.dart-model to parse into Dart form
    }
  }catch(e){ // if any error occurs to build connection with url-website (like Network or any other)
    debugPrint("Api error: $e");
  }finally{ // after working (fetching data) close the connection from Website:
    Client.close();
  }
  }
}