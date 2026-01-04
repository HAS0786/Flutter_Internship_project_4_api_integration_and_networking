import 'package:api_integration_and_networking/services/services_model.dart';
import 'package:api_integration_and_networking/views/userprofile.dart';
import 'package:flutter/material.dart';
import '../models/userdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserData>? data; // now we make a List (that we want to show on screen , as we show all user at-once so we need a list)
  bool isloaded = false; // to show connection send data
  String? errorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData(); // load data from service (who fetch data from Internet and then call userdata-model to parse into Dart then send here)
  }

  loadData() async {
    try {
      data = await RemoteServices().getData(); // call the function of Service:
      if (!mounted) return; // mounted means screen live or dead (if dead no need of calling set-state so return)
      if (data != null) {
        setState(() {
          isloaded = true;
        });
      } else {
        setState(() {
          errorMessage = "Failed to Load Data";
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data Fetch by API"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center( // flow is (if error message {not fetch data} otherwise check is data load or take time {if take time } so ProgressIndicator and after loading show data"
        child: errorMessage != null
            ? Text(errorMessage!, style: const TextStyle(color: Colors.red))
            : isloaded
            ? ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          data![index].name[0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(data![index].name),
                      subtitle: Text(data![index].email),
                      trailing: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context,)=>Userprofile(userdetail: data![index])));
                      }, icon: Icon(Icons.arrow_forward_ios, size: 16)),
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
