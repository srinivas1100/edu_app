import 'package:edu_app/Home/auth/screens/login_screen.dart';
import 'package:edu_app/Home/home_page.dart';
import 'package:edu_app/services/auht.dart';
import 'package:edu_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<UserId?>(
      stream: auth.authStateChanged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserId? user = snapshot.data;
          if (user == null) {
            return LoginScreen(authBase: auth);
          }
          return MultiProvider(providers: [
            Provider<Database>(create: (_) => FirestoreDatabase(uid: user.uid!),),
            //Provider<MatchBase>(create: (_) => Match(),),
            ],
           child:const MyHomePage(),
           );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),)
        );
      });
}}