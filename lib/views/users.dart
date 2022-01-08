import 'package:flutter/material.dart';
import 'package:voice_auth_app/data/datas.dart';
import 'package:voice_auth_app/data/ev.dart';

class UsersView extends StatelessWidget {
  const UsersView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>[
             const Text(
                "   Users",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xffffffff)
                ),
              ),
              const SizedBox(height: 40,),
              Expanded(
                child: ListView(
                  children: usersData.map((user) => userCardWithSeparation(user)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userCardWithSeparation(User user){
    return Column(
      children: <Widget>[
        userCard(user),
        const SizedBox(height: 10,)
      ],
    );
  }

  Widget userCard(User user){
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 25),
        child: Row(
         children: <Widget>[
            const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            const SizedBox(width: 20,),
            SizedBox(
              width: 200,
              child: Text(
                user.name,
                style: const TextStyle(
                  fontSize: 28,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}