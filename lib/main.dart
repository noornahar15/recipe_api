import 'package:api_getdata/views/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> userList = [];
  bool _isLoading = false;

  Future<List<User>> getUser() async {
    String searchUrl = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(Uri.parse(searchUrl));
    setState(() {
      userList = userFromJson(response.body.toString());
      _isLoading = true;
    });
    return getUser();
  }

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    getUser();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(
        userList: userList,
        cookTime: '',
        rating: 0.0,
        isLoading: _isLoading,
      ),
    );
  }
}
