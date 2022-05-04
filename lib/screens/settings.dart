import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Settingspagestate();
}

class Settingspagestate extends State<Settingspage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 10),
                  Text("Account",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 10),
              /*
              const Icon(
                Icons.password,
                color: Colors.pink,
               
              ),
              */
              buildaccountoptions(context, "change Password"),
              /*
              const Icon(
                Icons.language,
                color: Colors.pink,
              ),
              */
              buildaccountoptions(context, "Language settings"),
              /*
              const Icon(
                Icons.shield,
                color: Colors.pink,
              ),
              */
              buildaccountoptions(context, "privacy and security"),
            ],
          )),
    );
  }

  GestureDetector buildaccountoptions(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [Text("update"), Text("update")],
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent)),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
