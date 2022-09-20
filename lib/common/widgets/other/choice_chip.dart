part of '../../common.dart';

class ChoiceChips extends StatefulWidget {
  const ChoiceChips({ Key? key }) : super(key: key);

  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  int? _value = 1;
  var list = ['Coffee', 'Tea', 'Ice', 'Hot'];

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(10,
              (int index) => 
              Container(
                margin: EdgeInsets.only(right: 20),
                child: ChoiceChip(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  selectedColor: primaryC,
                  backgroundColor: Color(0xFFbdc3c7),
                  labelStyle: secondaryText.copyWith(fontWeight: FontWeight.bold),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                  label: Text('Item $index', style: secondaryText),
                ),
              )
        ).toList(),
      ),
    );
  }
}

