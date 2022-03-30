
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_assignment/screens/profile_selection.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {

  VerificationScreen({required this.phone});

  final String phone;
  // static const String id = 'verification_screen';

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  late String _pin;
  // final FocusNode _pinPutFocusNode = FocusNode();


  _verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
            if(value.user != null){
              Navigator.pushNamed(context, ProfileSelection.id);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent: (String verificationID, int ? resendToken){
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID){
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60)
    );
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                  icon: Icon(Icons.arrow_back_sharp),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  });
            }
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verify Phone',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50.0, 8.0, 50.0, 30.0),
              child: Text(
                "Code is sent to ${widget.phone}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFFB4B5BD),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(30.0),
              child: Pinput(
                length: 6,
                keyboardType: TextInputType.number,
                controller: _pinPutController,
                focusedPinTheme: PinTheme(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(

                    shape: BoxShape.rectangle,
                    color: Color(0xFF93D2F3),
                  )
                ),
                submittedPinTheme: PinTheme(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFF93D2F3),
                  ),
                ),
                followingPinTheme: PinTheme(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFF93D2F3),
                  )
                ),
                pinAnimationType: PinAnimationType.fade,
                onSubmitted: (pin) async{
                  _pin = pin;
                  try{
                    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: _pin)).then((value) async{
                      if(value.user != null){
                        Navigator.pushNamed(context, ProfileSelection.id);
                      }
                    });
                  }
                  catch(e){
                    FocusScope.of(context).unfocus();
                    _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text('Ivalid OTP!')));
                  }
              },
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFFB4B5BD),
                  ),
                ),
                Flexible(
                  child: TextButton(
                      onPressed: (){},
                      child: Text(
                        'Request Again',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: MaterialButton(
                  child: Text(
                    ' VERIFY AND CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Color(0xff2e3b62),
                  minWidth: double.infinity,
                  height: 50.0,
                  onPressed: () {
                        (pin) async{
                      _pin = pin;
                      try{
                        await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode, smsCode: _pin)).then((value) async{
                          if(value.user != null){
                            Navigator.pushNamed(context, ProfileSelection.id);
                          }
                        });
                      }
                      catch(e){
                        FocusScope.of(context).unfocus();
                        _scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text('Ivalid OTP!')));
                      }
                    };

                  }),
            )
          ],
        ),
      ),
    );
  }

}
