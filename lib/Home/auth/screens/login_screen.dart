import 'package:edu_app/Home/auth/widgets/auth_form.dart';
import 'package:edu_app/services/auht.dart';
import 'package:edu_app/widges/dilogbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  // static const routeName = 'loginScreen';

  final AuthBase authBase;

  const LoginScreen({Key? key, required this.authBase}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isLoading = false;
  void _submitAuthForm(
    String email,
    String name,
    String password,
    bool isLogin,
    context,
  ) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    try {
      if (isLogin) {
        await auth.signInWithEmailAndPassword(email, password);
      } else {
        await auth.createUserWithEmailAndPassword(email, password);

        final userId = UserId(
            email: email, name: name, uid: auth.currentUser!.uid.toString());
        await widget.authBase.userData(userId);
      }
    } catch (err) {
      print(err.toString());
      DilogBox(
              title: 'signin failed', subtext: err.toString(), actionText: 'ok')
          .show(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        submitFn: (String email, String name, String password, bool isLogin,
                BuildContext ctx) =>
            _submitAuthForm(email, name, password, isLogin, context),
        isLoading: _isLoading,
       
      ),
    );
  }
}
