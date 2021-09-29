import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {

  Future sendPasswordResetEmail(String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? _userEmail = '';

    void _trySubmit() async{
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        _formKey.currentState!.save();
        await sendPasswordResetEmail(_userEmail!);
        Navigator.pop(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
      ),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top:12.0, left: 12.0, right: 12.0),
                child: Column(children: [
        Form(
          key: _formKey,
          child: TextFormField(
            key: const ValueKey('email'),
            validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'plese enter valid email adress.';
                }
                return null;
            },
            onSaved: (value) {
                _userEmail = value!;
            },
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'email addres..'),
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: _trySubmit, child: Text('Forget Password')),
      ]),
              ))),
    ));
  }
}
