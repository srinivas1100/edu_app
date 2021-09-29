import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .10,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "Search collage...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
      ),
    );
  }
}
