part of '../../common.dart';


class ProductCardOnLoad extends StatelessWidget {
  const ProductCardOnLoad({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Card(
      child: InkWell(
        splashColor: Colors.brown.withAlpha(30),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 80,
                  borderRadius: BorderRadius.circular(8),
                  minLength: MediaQuery.of(context).size.width,
                )),
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                  minLength: 20,
                )),
              ),
              SkeletonParagraph(
                style: SkeletonParagraphStyle(
                lines: 1,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                  minLength: 80,
                )),
              ),
            ],
          )
        )
      ),
    );
  }
}