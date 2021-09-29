import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/widges/collage_card.dart';
import 'package:flutter/material.dart';

class CollagePageView extends StatelessWidget {
  const CollagePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('Engineering Courses')
        .snapshots();
    //  final collage = Provider.of<CollageId>(context, listen: false);
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.search),
                                hintText: "Search collage...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            body: StreamBuilder(
              stream: users,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 8.0,
                      mainAxisExtent: 160.0
                    ),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return CollageCard(
                        name: data['name'],
                        url: data['img'],
                        press: () {},
                      );
                    }).toList(),
                  ),
                );
              },
            )));
  }
}
