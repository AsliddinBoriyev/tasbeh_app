import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController fieldController = TextEditingController();
  int value = 0;

  launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC6EFEB),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/tasbheeh.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                const Text(
                  'Tashbeeh Counter',
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 20.0),
                    enabled: false,
                    controller: fieldController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red, //this has no effect
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250.0, top: 200.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value = 0;
                        fieldController.text = '${value}';
                      });
                    },
                    child: Container(
                      height: 60.0,
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child:  const Center(
                        child: Text(
                          'Clear',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value++;
                        fieldController.text = '${value}';
                      });
                    },
                    child: Container(
                      height: 150.0,
                      decoration:  const BoxDecoration(
                          color: Color(0xff1B70B1), shape: BoxShape.circle),
                      child: const Center(
                        child: Text(
                          'Tasbheeh',
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:()=> launchInBrowser('https://www.instagram.com/'),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'This app build by: Asliddin Follow me on\n', ),
                        TextSpan(text: 'Insta as.liddin1769!',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent)),
                      ],
                    ),
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}