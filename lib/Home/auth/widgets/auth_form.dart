import 'package:edu_app/Home/auth/screens/forget_screen.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, required this.submitFn, required this.isLoading})
      : super(key: key);

  final bool isLoading;
  final void Function(
    String email,
    String name,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String? _userEmail = '';
  String? _userName = '';
  String? _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail!.trim(),
        _userName!.trim(),
        _userPassword!.trim(),
        _isLogin,
        context,
      );
    }
  }

  final FocusNode _email = FocusNode();
  final FocusNode _name = FocusNode();
  final FocusNode _password = FocusNode();

  void _emailEditing() {
    FocusScope.of(context).requestFocus(_isLogin ? _password : _name);
  }

  void _nameEditing() {
    FocusScope.of(context).requestFocus(_password);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  TextFormField(
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
                    focusNode: _email,
                    autocorrect: true,
                    onEditingComplete: _emailEditing,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: 'email addres..'),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('name'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'plese enter valid name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value!;
                      },
                      focusNode: _name,
                      onEditingComplete: _nameEditing,
                      autocorrect: true,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'plese enter valid name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    obscureText: true,
                    focusNode: _password,
                    onEditingComplete: _trySubmit,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 12),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                        onPressed: _trySubmit,
                        child: Text(_isLogin ? "Login" : "Signup")),
                  if (!widget.isLoading)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? "Create a new account"
                            : "I already have an account")),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetScreen()),
                        );
                      },
                      child: Text("Forget Password"))
                ])),
          ),
        ),
      ),
    );
  }
}
