import 'package:edu_app/widges/collage_card.dart';
import 'package:edu_app/widges/searchbox.dart';
import 'package:edu_app/widges/slider.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(child: Column(
      children: [
        const PrefetchImageDemo(),
        const SizedBox(height: 20,),
        CollageCard(press: () {},name: "Srinu", url: 'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',),
        const SizedBox(height: 20,),
        const SearchBox(),
      ],
    ));
  }
}

