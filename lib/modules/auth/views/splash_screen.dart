part of '../auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => _authController.userLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("Cashier app version 1.0.0", textAlign: TextAlign.center,style: silverText.copyWith(fontWeight: FontWeight.bold)),
      ) ,
      body: SafeArea(
        child: Center(
          child:  Container(
            padding: EdgeInsets.all(10.0),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin:  Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF29C7B8),
                  purpleC
                ]
              ),
              borderRadius : BorderRadius.all(Radius.circular(20.0))
            ),
            child: Lottie.asset("assets/loading.json", height: 180),
          )
        )
      )
    );
  }
}
