// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.pinkAccent,
//     );
//   }
// }


import 'package:edu_app/services/auht.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authbase = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<UserId?>(
        stream: authbase.userStream(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Persion(name: user?.name, email: user?.email);
        });
  }
}

class Persion extends StatelessWidget {
  const Persion({
    Key? key,
  this.name,
  this.email,
  }) : super(key: key);
  final String? name;
  final String? email;
  Future<void> _signOut(BuildContext context)async {
    try {
      
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
  // Future<void> _conformSignOut(BuildContext context) async {
  //   final requist = await DilogBox(title: "Logout", subtext: 'Are you sure that you want to logout?', cancelAction: 'cancle', actionText: 'Logout',).show(context);
  //   if (requist == true) {
  //     _signOut(context);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name!),
                      Text(email!),
                    ]),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: const [
        //        Text("your Money"),
        //       Text("5000"),
        //     ],
        //   ),
        // ),
        // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        //   ElevatedButton(
        //     onPressed: () {},
        //     child:const Text("Add Money"),
        //   ),
        //   ElevatedButton(
        //     onPressed: () {},
        //     child:const Text("Withdraw"),
        //   )
        // ]),
        // const Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: Divider(
        //     height: 1.0,
        //     color: Color(0xff3B485B),
        //     indent: 10.0,
        //     endIndent: 10.0,
        //   ),

        // ),
        //  ElevatedButton(
        //     onPressed: () => _signOut(context),
        //     child:const Text("LOGOUT"),
        //   )
      ],
    );
  }
}
