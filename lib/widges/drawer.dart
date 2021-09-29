import 'package:edu_app/collage_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  // final Function onTap;
  const MyDrawer({
    Key? key,
    //required this.onTap
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .10,
                color: Colors.black12,
              ),
              const Divider(height: 1),
              ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Engineering Courses"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CollagePageView())
                    );
                    // print("home");
                  }),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.power_off_outlined),
                title: const Text("Architecture Courses"),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
                // => widget.onTap(context, 1),
              ),
              const Divider(
                height: 1,
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text("Favorites"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text("Your orders"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              ListTile(
                  leading: const Icon(Icons.directions_walk_rounded),
                  title: const Text("Dark theme"),
                  onTap: () {}
                  //=> widget.onTap(context, 2),
                  ),
              ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {}
                  //=> widget.onTap(context, 2),
                  ),
              ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text("Send Feedback"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              ListTile(
                  leading: const Icon(Icons.rate_review),
                  title: const Text("Rate us"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              ListTile(
                  leading: const Icon(Icons.comment),
                  title: const Text("Complients"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("logout"),
                  onTap: () {}
                  //=> widget.onTap(context, 0),
                  ),
              const Divider(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class UserAccount extends StatelessWidget {
//   const UserAccount({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final authbase = Provider.of<AuthBase>(context, listen: false); 
//     return StreamBuilder<UserId>(
//       stream: authbase.userStream(),
//       builder: (context, snapshot) {
//         final user = snapshot.data!;
//         if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           return UserAccountsDrawerHeader(
//            accountName: Text(user.name.toString()),
//            accountEmail: Text(user.email.toString()),
//            currentAccountPicture:const CircleAvatar(
//             child: Icon(Icons.person),
//           backgroundColor: Colors.white,
//         ),
//       );
//       },
    
//     );
//   }
// }