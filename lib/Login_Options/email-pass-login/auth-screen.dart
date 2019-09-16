import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:midlandfinal/Login_Options/email-pass-login/auth.dart';
import 'package:provider/provider.dart';
import 'package:midlandfinal/Login_Options/google login/google_sign_in_btn.dart';
import 'package:midlandfinal/Login_Options/google login/google_auth.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:midlandfinal/Login_Options/google login/logger.dart";
import 'package:midlandfinal/Login_Options/google login/google_sign_in_btn.dart';
import 'package:midlandfinal/screens/homescreen2.dart';
import 'package:midlandfinal/Login_Options/google login/masked_text.dart';
import 'package:midlandfinal/Login_Options/google login/reactive_refresh_indicator.dart';


enum AuthMode { Signup, Login }
enum AuthStatus { SOCIAL_AUTH, PHONE_AUTH, SMS_AUTH, PROFILE_AUTH }


// class AuthScreenEmailPass extends StatelessWidget {
//   static const String id = 'auth-screen';

  // Widget build(BuildContext context) {
  //   final deviceSize = MediaQuery.of(context).size;
  //   // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
  //   // transformConfig.translate(-10.0);
  //   return Scaffold(
  //     // resizeToAvoidBottomInset: false,
  //     body: Stack(
  //       children: <Widget>[
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Color(0xffF7BC45),
  //           ),
  //         ),
  //         SingleChildScrollView(
  //           child: Container(
  //             height: deviceSize.height,
  //             width: deviceSize.width,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 Flexible(
  //                   child: Container(
  //                     height: 180,
  //                     width: 180,
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(16.0),
  //                       child: ClipRRect(
  //                         child: Image.asset('images/logo1.jpg'),
  //                         borderRadius: BorderRadius.circular(30.0),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Flexible(
  //                   flex: deviceSize.width > 600 ? 2 : 1,
  //                   child: AuthCard(),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future<void> _submit() async{
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
      await Provider.of<Auth>(context, listen: false).login(_authData['email'], _authData['password']);
    } else {
      // Sign user up
      await Provider.of<Auth>(context, listen: false).signup(_authData['email'], _authData['password']);
    }
    setState(() {
      _isLoading = false;
    });
  }



  // void _switchAuthMode() {
  //   if (_authMode == AuthMode.Login) {
  //     setState(() {
  //       _authMode = AuthMode.Signup;
  //     });
  //   } else {
  //     setState(() {
  //       _authMode = AuthMode.Login;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 600 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    icon: Icon(Icons.mail_outline),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value;

                  },
                ),
                // if (_authMode == AuthMode.Signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.Signup,
                //     keyboardType: TextInputType.text,
                //     decoration: InputDecoration(
                //         labelText: 'Full Name', icon: Icon(Icons.person)),
                //     validator: (value) {
                //       if (value.isEmpty || value.length<5 ) {
                //         return 'Please enter Full Name';
                //       }
                //     },
                //     onSaved: (value) {
                //       _authData['name'] = value;

                //     },
                //   ),
                // if (_authMode == AuthMode.Signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.Signup,
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(
                //       suffix: RaisedButton(
                //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //         color: Colors.black,
                //         splashColor: Color(0xffF7BC45),
                //         child: Text('Verify',style: TextStyle(color: Colors.white),),
                //         onPressed: (){

                //         },
                //       ),
                //         labelText: 'Phone Number', icon: Icon(Icons.phone)),
                //     validator: (value) {
                //       if (value.isEmpty || value.length < 9) {
                //         return 'Please enter correct number';
                //       }
                //     },
                    
                //     onSaved: (value) {
                //       _authData['mobile'] = value;

                //     },
                //   ),
                // if (_authMode == AuthMode.Signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.Signup,
                //     keyboardType: TextInputType.number,
                //     decoration: InputDecoration(
                //         labelText: 'OTP', icon: Icon(Icons.perm_phone_msg)),
                //     validator: (value){
                //       if(value.isEmpty || value.length < 5){
                //         return 'Please check again';
                //       }
                //     },
                //     onSaved: (value){
                //       _authData['otp'] = value;

                //     },
                //   ),
                TextFormField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      labelText: 'Password', icon: Icon(Icons.vpn_key)),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                // if (_authMode == AuthMode.Signup)
                //   TextFormField(
                //     enabled: _authMode == AuthMode.Signup,
                //     decoration: InputDecoration(
                //         labelText: 'Confirm Password',
                //         icon: Icon(Icons.vpn_key)),
                //     obscureText: true,
                //     validator: _authMode == AuthMode.Signup
                //         ? (value) {
                //             if (value != _passwordController.text) {
                //               return 'Passwords do not match!';
                //             }
                //           }
                //         : null,
                //   ),
                SizedBox(
                  height: 10,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    color: Color(0xff252B30),
                    textColor: Color(0xffCCCFD0),
                  ),
                  Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),
              Text("OR",style: TextStyle(fontSize: 20),),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 36,
                    )),
              ),

            ]),
                // FlatButton(
                //   child: Text(
                //     '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                //     style: TextStyle(fontWeight: FontWeight.w700),
                //   ),
                //   onPressed: _switchAuthMode,
                //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   textColor: Colors.black54,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//todo

class AuthScreen extends StatefulWidget {
  static const String id = 'auth-screen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const String TAG = "AUTH";
  AuthStatus status = AuthStatus.SOCIAL_AUTH;

  // Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<MaskedTextFieldState> _maskedPhoneKey =
      GlobalKey<MaskedTextFieldState>();

  // Controllers
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // Variables
  String _phoneNumber;
  String _errorMessage;
  String _verificationId;
  Timer _codeTimer;

  bool _isRefreshing = false;
  bool _codeTimedOut = false;
  bool _codeVerified = false;
  Duration _timeOut = const Duration(minutes: 1);

  // Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();



  GoogleSignInAccount _googleUser;
  FirebaseUser _firebaseUser;

  // PhoneVerificationFailed
  verificationFailed(AuthException authException) {
    _showErrorSnackbar(
        "We couldn't verify your code for now, please try again!");
    Logger.log(TAG,
        message:
            'onVerificationFailed, code: ${authException.code}, message: ${authException.message}');
  }

  // PhoneCodeSent
  codeSent(String verificationId, [int forceResendingToken]) async {
    Logger.log(TAG,
        message:
            "Verification code sent to number ${phoneNumberController.text}");
    _codeTimer = Timer(_timeOut, () {
      setState(() {
        _codeTimedOut = true;
      });
    });
    _updateRefreshing(false);
    setState(() {
      this._verificationId = verificationId;
      this.status = AuthStatus.SMS_AUTH;
      Logger.log(TAG, message: "Changed status to $status");
    });
  }

  // PhoneCodeAutoRetrievalTimeout
  codeAutoRetrievalTimeout(String verificationId) {
    Logger.log(TAG, message: "onCodeTimeout");
    _updateRefreshing(false);
    setState(() {
      this._verificationId = verificationId;
      this._codeTimedOut = true;
    });
  }

  // Styling

  final decorationStyle = TextStyle(color: Colors.grey[50], fontSize: 16.0);
  final hintStyle = TextStyle(color: Colors.white24);

  //

  @override
  void dispose() {
    _codeTimer?.cancel();
    super.dispose();
  }

  // async

  Future<void> _updateRefreshing(bool isRefreshing) async {
    Logger.log(TAG,
        message: "Setting _isRefreshing ($_isRefreshing) to $isRefreshing");
    if (_isRefreshing) {
      setState(() {
        this._isRefreshing = false;
      });
    }
    setState(() {
      this._isRefreshing = isRefreshing;
    });
  }

  _showErrorSnackbar(String message) {
    _updateRefreshing(false);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _signIn() async {
   
  GoogleSignInAccount user = _googleSignIn.currentUser;
    Logger.log(TAG, message: "Just got user as: $user");

    final onError = (exception, stacktrace) {
      Logger.log(TAG, message: "Error from _signIn: $exception");
      _showErrorSnackbar(
          "Couldn't log in with your Google account, please try again!");
      user = null;
    };
        if (user == null) {
      user = await _googleSignIn.signIn().catchError(onError);
       
        Logger.log(TAG, message: "Received $user");
      final GoogleSignInAuthentication googleAuth = await user.authentication;

      Logger.log(TAG, message: "Added googleAuth: $googleAuth");

      final result = await _auth
          .signInWithCredential(GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          ))
          .catchError(onError);
      _firebaseUser = result.user;
      
      
    }
    if (user != null) {
      _updateRefreshing(false);
      _googleUser = user;
      setState(() {
        this.status = AuthStatus.PHONE_AUTH;
        Logger.log(TAG, message: "Changed status to $status");
      });
      return null;
    }
    return null;
    }
  

  

  //   _checkUser(){
  //   if(FirebaseAuth.instance.currentUser() != null){
  //     Navigator.of(context).pushReplacement(CupertinoPageRoute(
  //             builder: (context) => Home(firebaseUser: ,
                

  //                 ),
  //       ));
  //   }
  // }

    

  Future<Null> _submitPhoneNumber() async {
    final error = _phoneInputValidator();
    if (error != null) {
      _updateRefreshing(false);
      setState(() {
        _errorMessage = error;
      });
      return null;
    } else {
      _updateRefreshing(false);
      setState(() {
        _errorMessage = null;
      });
      final result = await _verifyPhoneNumber();
      Logger.log(TAG, message: "Returning $result from _submitPhoneNumber");
      return result;
    }
  }

  String get phoneNumber {
    try {
      String unmaskedText = _maskedPhoneKey.currentState?.unmaskedText;
      if (unmaskedText != null) _phoneNumber = "+91$unmaskedText".trim();
    } catch (error) {
      Logger.log(TAG,
          message: "Couldn't access state from _maskedPhoneKey: $error");
    }
    return _phoneNumber;
  }

  Future<Null> _verifyPhoneNumber() async {
    Logger.log(TAG, message: "Got phone number as: ${this.phoneNumber}");
    await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNumber,
        timeout: _timeOut,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        verificationCompleted: _linkWithPhoneNumber,
        verificationFailed: verificationFailed);
    Logger.log(TAG, message: "Returning null from _verifyPhoneNumber");
    return null;
  }

  Future<Null> _submitSmsCode() async {
    final error = _smsInputValidator();
    if (error != null) {
      _updateRefreshing(false);
      _showErrorSnackbar(error);
      return null;
    } else {
      if (this._codeVerified) {
        await _finishSignIn(await _auth.currentUser());
      } else {
        Logger.log(TAG, message: "_linkWithPhoneNumber called");
        await _linkWithPhoneNumber(
          PhoneAuthProvider.getCredential(
            smsCode: smsCodeController.text,
            verificationId: _verificationId,
          ),
        );
      }
      return null;
    }
  }

  Future<void> _linkWithPhoneNumber(AuthCredential credential) async {
    final errorMessage = "We couldn't verify your code, please try again!";

    final result =
        await _firebaseUser.linkWithCredential(credential).catchError((error) {
      print("Failed to verify SMS code: $error");
      _showErrorSnackbar(errorMessage);
    });
    _firebaseUser = result.user;

    await _onCodeVerified(_firebaseUser).then((codeVerified) async {
      this._codeVerified = codeVerified;
      Logger.log(
        TAG,
        message: "Returning ${this._codeVerified} from _onCodeVerified",
      );
      if (this._codeVerified) {
        await _finishSignIn(_firebaseUser);
      } else {
        _showErrorSnackbar(errorMessage);
      }
    });
  }

  Future<bool> _onCodeVerified(FirebaseUser user) async {
    final isUserValid = (user != null &&
        (user.phoneNumber != null && user.phoneNumber.isNotEmpty));
    if (isUserValid) {
      setState(() {
        // Here we change the status once more to guarantee that the SMS's
        // text input isn't available while you do any other request
        // with the gathered data
        this.status = AuthStatus.PROFILE_AUTH;
        Logger.log(TAG, message: "Changed status to $status");
      });
    } else {
      _showErrorSnackbar("We couldn't verify your code, please try again!");
    }
    return isUserValid;
  }

  _finishSignIn(FirebaseUser user) async {
    await _onCodeVerified(user).then((result) {
      if (result) {
        // Here, instead of navigating to another screen, you should do whatever you want
        // as the user is already verified with Firebase from both
        // Google and phone number methods
        // Example: authenticate with your own API, use the data gathered
        // to post your profile/user, etc.
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => Home(
            // googleUser: _googleUser,
            // firebaseUser: _firebaseUser,
          ),
        ));
      } else {
        setState(() {
          this.status = AuthStatus.SMS_AUTH;
        });
        _showErrorSnackbar(
            "We couldn't create your profile for now, please try again later");
      }
    });
  }

  // Widgets

  //todo:t

  Widget _buildSocialLoginBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 24.0),
          GoogleSignInButton(
            onPressed: () {
             
              _updateRefreshing(true);
            } 
          ),
          // FlatButton(
          //   child: Text("Sign out"),
          //   onPressed: () async {
          //     await GoogleSignIn().signOut();
          //     await FirebaseAuth.instance.signOut();
          //     Navigator.of(context).pushAndRemoveUntil(
          //       CupertinoPageRoute(builder: (context) => AuthScreen()),
          //       (route) => false,
          //     );
          //   },
          // )
        ],
      ),
    );
  }

  Widget _buildConfirmInputButton() {
    final theme = Theme.of(context);
    return IconButton(
      icon: Icon(Icons.check),
      disabledColor: theme.buttonColor,
      onPressed: (this.status == AuthStatus.PROFILE_AUTH)
          ? null
          : () => _updateRefreshing(true),
    );
  }

  Widget _buildPhoneNumberInput() {
    return MaskedTextField(
      key: _maskedPhoneKey,
      mask: "xxxxx-xxxxx",
      keyboardType: TextInputType.number,
      maskedTextFieldController: phoneNumberController,
      maxLength: 11,
      onSubmitted: (text) => _updateRefreshing(true),
      style: Theme.of(context)
          .textTheme
          .subhead
          .copyWith(fontSize: 18.0, color: Colors.white),
      inputDecoration: InputDecoration(
        isDense: false,
        enabled: this.status == AuthStatus.PHONE_AUTH,
        counterText: "",
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
        ),
        labelText: "Phone",
        labelStyle: decorationStyle,
        hintText: "99999-99999",
        hintStyle: hintStyle,
        errorText: _errorMessage,
      ),
    );
  }

  Widget _buildPhoneAuthBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Text(
            "We'll send an SMS message to verify your identity, please enter your number right below!",
            style: decorationStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(flex: 5, child: _buildPhoneNumberInput()),
              Flexible(flex: 1, child: _buildConfirmInputButton())
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmsCodeInput() {
    final enabled = this.status == AuthStatus.SMS_AUTH;
    return TextField(
      keyboardType: TextInputType.number,
      enabled: enabled,
      textAlign: TextAlign.center,
      controller: smsCodeController,
      maxLength: 6,
      onSubmitted: (text) => _updateRefreshing(true),
      style: Theme.of(context).textTheme.subhead.copyWith(
            fontSize: 32.0,
            color: enabled ? Colors.white : Theme.of(context).buttonColor,
          ),
      decoration: InputDecoration(
        counterText: "",
        enabled: enabled,
        hintText: "--- ---",
        hintStyle: hintStyle.copyWith(fontSize: 42.0),
      ),
    );
  }

  Widget _buildResendSmsWidget() {
    return InkWell(
      onTap: () async {
        if (_codeTimedOut) {
          await _verifyPhoneNumber();
        } else {
          _showErrorSnackbar("You can't retry yet!");
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: "If your code does not arrive in 1 minute, touch",
            style: decorationStyle,
            children: <TextSpan>[
              TextSpan(
                text: " here",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmsAuthBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Text(
            "Verification code",
            style: decorationStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 64.0),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(flex: 5, child: _buildSmsCodeInput()),
              Flexible(flex: 2, child: _buildConfirmInputButton())
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: _buildResendSmsWidget(),
        )
      ],
    );
  }

  String _phoneInputValidator() {
    if (phoneNumberController.text.isEmpty) {
      return "Your phone number can't be empty!";
    } else if (phoneNumberController.text.length < 9) {
      return "This phone number is invalid!";
    }
    return null;
  }

  String _smsInputValidator() {
    if (smsCodeController.text.isEmpty) {
      return "Your verification code can't be empty!";
    } else if (smsCodeController.text.length < 6) {
      return "This verification code is invalid!";
    }
    return null;
  }

  Widget _buildBody() {
    Widget body;
    switch (this.status) {
      case AuthStatus.SOCIAL_AUTH:
        body = _buildSocialLoginBody();
        break;
      case AuthStatus.PHONE_AUTH:
        body = _buildPhoneAuthBody();
        break;
      case AuthStatus.SMS_AUTH:
      case AuthStatus.PROFILE_AUTH:
        body = _buildSmsAuthBody();
        break;
    }
    return body;
  }

  Future<Null> _onRefresh() async {
    switch (this.status) {
      case AuthStatus.SOCIAL_AUTH:
        return await _signIn();
        break;
      case AuthStatus.PHONE_AUTH:
        return await _submitPhoneNumber();
        break;
      case AuthStatus.SMS_AUTH:
        return await _submitSmsCode();
        break;
      case AuthStatus.PROFILE_AUTH:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
            key: _scaffoldKey,

      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF7BC45),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 180,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ClipRRect(
                          child: Image.asset('images/logo1.jpg'),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                    Container(
        child: ReactiveRefreshIndicator(
          onRefresh: _onRefresh,
          isRefreshing: _isRefreshing,
          child: Container(child: _buildBody()),
        ),
      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



