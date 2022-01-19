import 'package:am_awareness/main_bottom_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  Future<void> performLogin(String provider, List<String> scopes, Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
      final user = FirebaseAuth.instance.currentUser;
      final idToken = await user?.getIdToken();
      print("asdf: $idToken");
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    }
  }

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
      home: StreamBuilder(
        initialData: null,
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(FirebaseAuth.instance.currentUser == null) {
            performLogin("microsoft.com", ["email openid"], {'tenant': '9095cb99-438e-4daa-8f2c-d0a04c8fac4e'});
          }
          return const MyHomePage(title: 'Advanced Mobility awareness');
        },
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MainBottomClass();
  }


}
