import 'package:flutter/material.dart';

class CollageCard extends StatelessWidget {
  const CollageCard(
      {Key? key, required this.name, required this.url, required this.press})
      : super(key: key);
  final String name, url;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press(),
      child: Container(
        height: size.height * .20,
        width: size.width * .45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: NetworkImage(url),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
                child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
