part of '../../common.dart';


class ChoiceChipOnLoad extends StatelessWidget {
  const ChoiceChipOnLoad({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(10,
              (int index) => 
                 SizedBox(
                   width: 80,
                   child: SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 30,
                        width: 64,
                        borderRadius: BorderRadius.circular(8)),
                ),
                 )
        ).toList(),
      ),
    );
  }
}