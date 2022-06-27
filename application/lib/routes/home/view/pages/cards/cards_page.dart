import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsPage extends StatefulWidget {
  final Color color;

  CardsPage({Key? key, required this.color}) : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color.withAlpha(100),
      child: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("asd")]),
        ],
      ),
    );
  }
}
