import 'package:flutter/material.dart';

class ProfileSelection extends StatefulWidget {
  static const String id = 'profile_selection';

  @override
  _ProfileSelectionState createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {

  bool _value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Please select your profile',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              child: Container(
                height: 89.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (int ? value) {
                        setState(() {
                          val = value!;
                        });
                      },
                      activeColor: Color(0xff2e3b62),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/warehouse.png'),
                              fit: BoxFit.fill,
                            )
                        ),


                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 77.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Shipper'
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Flexible(

                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing'
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            GestureDetector(
              child: Container(
                height: 100.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (int ? value) {
                        setState(() {
                          val = value!;
                        });
                      },
                      activeColor: Color(0xff2e3b62),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/truck.png'),
                              fit: BoxFit.fill,
                            )
                        ),


                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 77.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                  'Transporter'
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Flexible(

                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing'
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
