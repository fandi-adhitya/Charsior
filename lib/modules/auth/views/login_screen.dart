part of '../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _authController = Get.find<AuthController>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    _authController.userLoggedIn();
  }

  void openCashBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: Column(children: [
                    Center(
                      child: Image.asset('assets/money.png', height: 140),
                    ),
                    SizedBox(height: 18),
                    TextField(
                      keyboardType: TextInputType.number,
                      style: draculaText,
                      cursorColor: primaryC,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          filled: true,
                          hintStyle: draculaText.copyWith(color: Colors.grey),
                          hintText: "Enter Open Cash",
                          fillColor: Colors.white70),
                    ),
                    SizedBox(height: 26),
                    TextButton(
                      onPressed: () { 
                        // _authController.goToCashierPage();
                        // _authController.oauthToken();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const CashierScreen()),
                        // );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: primaryC,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: whiteText.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: () {
            _authController.oauthToken(_usernameController.text, _passwordController.text); 
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFF197c82), borderRadius: BorderRadius.circular(10.0),
                 boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
            ),
            child: Center(
              child: Text(
                "LOG IN",
                style: whiteText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        child: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return Future.value(false);
          } ,
          child: Padding(
            padding : EdgeInsets.only(bottom : MediaQuery.of(context).viewInsets.bottom),
            child: SafeArea(
              child: Container(
              margin: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Text("Log in",
                              style: draculaText.copyWith(fontSize: 22)),
                          SizedBox(height: 10,),
                          Text("Enter your credentials to access your account",
                              style: silverText.copyWith(fontSize: 16), maxLines: 2,),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Text("Username", style: draculaText.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextField(
                    controller: _usernameController,
                    style: draculaText,
                    cursorColor: primaryC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        filled: true,
                        hintStyle: draculaText.copyWith(color: Colors.grey),
                        hintText: "Enter Username",
                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 20),
                  Text("Password", style: draculaText.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: isVisible,
                    style: draculaText,
                    cursorColor: primaryC,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility) ,
                            color: draculaC,
                            iconSize: 22),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        filled: true,
                        hintStyle: draculaText.copyWith(color: Colors.grey),
                        hintText: "Enter Password",
                        fillColor: Colors.white70),
                  ),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
