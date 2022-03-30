import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:liveasy_assignment/constants.dart';
import 'package:liveasy_assignment/screens/verification_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String verificationID = '';

   loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: '+91${_controller.text}',
      verificationCompleted: (PhoneAuthCredential credential)  {
         auth.signInWithCredential(credential).then((value){
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
        setState(() {});
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
              builder: (BuildContext context){
                return IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    });
              }
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Please enter your mobile number',
                  style: kTextStyle.copyWith(fontSize: 22.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 30.0),
                child: Text(
                    "You'll receive a 4 digit code to verify next.",
                  textAlign: TextAlign.center,
                  style: kDescriptionTextStyle,
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8.0),
                decoration: kBoxDecoration,
                child: Row(
                  children: [
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 130.0),
                        child: CountryCodePicker(
                          initialSelection: 'IN',
                          textStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          enabled: false,
                        ),
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mobile Number',
                          counterText: '',

                        ),
                        maxLength: 10,
                        controller: _controller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your number';
                            }
                            if( value.length != 10){
                              return 'Please Enter 10 digits.';
                            }
                            return null;
                          }

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Flexible(
                child: MaterialButton(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Color(0xff2e3b62),
                    minWidth: double.infinity,
                    height: 50.0,
                    onPressed: ()  {
                      if (_formKey.currentState!.validate()) {
                          loginWithPhone();
                        // print(verificationID);
                          if( verificationID.isNotEmpty){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    VerificationScreen(phone: _controller.text, verificationCode: verificationID,)));
                          }

                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
