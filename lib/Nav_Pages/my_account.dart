import 'package:flutter/material.dart';

class My_Account extends StatefulWidget {
  const My_Account({super.key});

  @override
  State<My_Account> createState() => _My_AccountState();
}

class _My_AccountState extends State<My_Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  radius: 30.0,
                  //backgroundColor: backgroundColor,
                  backgroundImage: AssetImage('assets/img.jpg'),
                ),
            )
          ],
        ),
      ),
    );
  }
}
