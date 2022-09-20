part of '../../common.dart';

class GlobalDialog{
 static showDialogLoading() {
   Get.dialog(
     WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
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
    ),
    barrierColor: Colors.white.withOpacity(0.8)
  ); 
 }
}