part of '../checkout.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/78536-success.json", height: 500, repeat: false),
                    Text("Successful Payment", style: primaryText.copyWith(fontWeight: FontWeight.bold, fontSize: 28)),
                    Text("Tap ok to return home", style: silverText.copyWith(fontSize: 16),),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: (){
                        Get.toNamed('/cashier');
                      }, 
                      child: Container(
                        height: 40,
                        width : 80,
                        decoration: BoxDecoration(
                          color: primaryC,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(child: Text("OK", style: whiteText.copyWith(fontWeight: FontWeight.bold),)),
                      )
                    )
                  ]
                )
          )
      ),
        )
    );
  }
}
