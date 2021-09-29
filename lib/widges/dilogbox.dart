import 'package:flutter/material.dart';

class DilogBox extends StatelessWidget {

  const DilogBox({ Key? key,required this.title,required this.subtext,required this.actionText, this.cancelAction }) : super(key: key);
  final String title,subtext,actionText;
  final String? cancelAction;

  Future<bool?> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context, 
      barrierDismissible: false,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subtext),
      
      actions: _buildActions(context),
    );
  }
  List<Widget> _buildActions (BuildContext context) {
    final dynamic actions = [];
    if (cancelAction != null) {
      actions.add(
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(cancelAction!)),
      );
    }
    actions.add(
      TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(actionText)),
    );
    return actions;
  }
}