import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scale_driver/AddUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("firebase test")),
        body: mFirebase(),
      ),
    );
  }
}

class mFirebase extends StatefulWidget {
  @override
  _mFirebaseState createState() => _mFirebaseState();
}

class _mFirebaseState extends State<mFirebase> {
  void signInAnonimously() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
  }

  void create_user_by_email() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "ivan@ivanov.com", password: "123QWEasdZXC");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: signInAnonimously,
          child: Text("SignIn anonymously"),
        ),
        ElevatedButton(
          onPressed: create_user_by_email,
          child: Text("Registration"),
        ),
        AddUser("stas", "abacus group", 34)
      ],
    );
  }
}
