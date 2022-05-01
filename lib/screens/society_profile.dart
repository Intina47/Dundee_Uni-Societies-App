import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

class SocietyProfilePage extends StatefulWidget {
  const SocietyProfilePage({Key? key}) : super(key: key);

  @override
  SocietyProfile createState() => SocietyProfile();
}

class SocietyProfile extends State<SocietyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: buildSocietyAppBAr(context),
      body: const ProfileBody(),
    );
  }

  AppBar buildSocietyAppBAr(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 9,
      actions: [
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null)),
      ],
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ///Societies cover photo
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset(
              'assets/images/cat.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          ///Name and Society Description
          Container(
            color: Colors.black,
            margin: const EdgeInsets.only(right: 10, left: 10),
            height: 160,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'CLUB NAME',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              ///Society Events
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),

              ///Society Committee
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                height: 160,
                child: Carousel(
                    dotColor: Colors.deepOrange,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.transparent,
                    dotSize: 2.0,
                    dotPosition: DotPosition.bottomRight,
                    radius: const Radius.circular(20),
                    overlayShadow: true,
                    overlayShadowColors: Colors.green,
                    overlayShadowSize: 0.9,
                    images: [
                      Image.asset(
                        'assets/images/cat.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/panther.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/panther2.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/panther3.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ]),
              )),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            height: 160,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
