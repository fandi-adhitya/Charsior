part of '../../common.dart';


class EmptyData extends StatelessWidget {
  const EmptyData({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.zero,
        child : Image.asset("assets/illustrations/ill_nodata.png", height: 200)
      ),
    );
  }
}