import 'package:auth_tn/util/constants.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: delftBlue,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 341,
                height: 250,
                decoration: const BoxDecoration(color: primarycolor),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 109,
                        height: 109,
                        child: CircleAvatar(
                          backgroundColor: opaquePrimarycolor,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        // decoration: ShapeDecoration(
                        //   // image: DecorationImage(
                        //   //   image: AssetImage("images/u0.png"),
                        //   //   fit: BoxFit.cover,
                        //   // ),
                        //   // shape: RoundedRectangleBorder(
                        //   //   side: BorderSide(width: 3, color: Color(0xFFFF6A6A)),
                        //   //   borderRadius: BorderRadius.circular(79),
                        //   // ),
                        // ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 143,
                        height: 26.60,
                        child: Text(
                          "Qwerty",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 58,
                        height: 12.81,
                        child: Text(
                          'View Profile',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      )
                    ]),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: const Text("Spam Analytics",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => searComm()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                title: const Text('Helpline Forum',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const HelpLine()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.report,
                  color: Colors.white,
                ),
                title: const Text("Report",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Report()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text("Profile",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Invitations()));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: const Text("Settings",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PaymentPage()));
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                title: const Text("Log Out",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () async {
                  // FirebaseAuth.instance.signOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const LogIn()),
                  // );
                },
              ),
              const Divider(),
            ],
          ),
        ));
  }
}
