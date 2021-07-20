import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 15),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
                size: 60,
              ),
              radius: 50,
            ),
          ),
          Text(
            '9988776655',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Your Name',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  size: 32,
                ),
              ),
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email_rounded,
                  size: 32,
                ),
              ),
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: 25),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.teal)),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "ADD ADDRESS",
                style: TextStyle(color: Colors.teal),
              ),
            ),
          )
        ],
      )),
    );
  }
}
