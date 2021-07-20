import 'package:flutter/material.dart';
import 'package:sk_mini/Controller/passwordController.dart';
import 'package:sk_mini/View/accountScreen.dart';
import 'package:sk_mini/View/addressScreen.dart';
import 'package:sk_mini/View/loginScreen.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff39FF14), Color(0xff228B22)])),
            child: DrawerHeader(
                child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_rounded,
                    size: 20,
                    color: Colors.green.shade600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "9988776655",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 5),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Account",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => AccountScreen())),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text(
              "Order History",
              style: TextStyle(fontSize: 18),
            ),
            // onTap: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (c) => Privacy())),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text(
              "Help & Support",
              style: TextStyle(fontSize: 18),
            ),
            // onTap: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (c) => Privacy())),
          ),
          ListTile(
            trailing: Text(
              "•",
              style: TextStyle(color: Colors.red, fontSize: 45),
            ),
            leading: Icon(Icons.sync),
            title: Text(
              "Updates",
              style: TextStyle(fontSize: 18),
            ),
            // onTap: () => Navigator.push(
            //     context, MaterialPageRoute(builder: (c) => Privacy())),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              "Add Address",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (c) => Address())),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Yes, Logout'),
                                onPressed: () {
                                  PasswordController.logout();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) => LoginScreen()));
                                  // Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        })

                    // PasswordController.logout(),
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (c) => LoginScreen()))
                  }),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Made with ",
                style: TextStyle(fontSize: 16),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(
                " by OM",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
