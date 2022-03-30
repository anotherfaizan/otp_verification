import 'package:flutter/material.dart';
import 'package:liveasy_assignment/constants.dart';
import 'package:liveasy_assignment/screens/registration_screen.dart';
import 'package:liveasy_assignment/components/dropdown_button.dart';

class MainScreen extends StatefulWidget {

  static const String id = 'main_screen';


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              width: 100.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main_screen_image.png'),
                    fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('Please select your Language',
              style: kTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50.0, 24.0, 50.0, 24.0),
              child: Text(
                'You can change the language at any time.',
                textAlign: TextAlign.center,
                style: kDescriptionTextStyle,
              ),
            ),
            Container(
              height: 48.0,
              width: 256.0,
              padding: EdgeInsets.only(left: 8.0),
              alignment: Alignment.center,
              decoration: kBoxDecoration,
              child: DropDownButton(),
            ),
            SizedBox(
              height: 10.0,
            ),

            MaterialButton(
              child: Text(
                  'NEXT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
                color: Color(0xff2e3b62),
                minWidth: 256.0,
                height: 48.0,
                onPressed: (){
                setState(() {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                });
            })
          ],
        ),
      ),

    );
  }
}
