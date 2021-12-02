import 'package:flutter/material.dart';
import 'typing.dart';

class Hide4063Container extends StatelessWidget {
  const Hide4063Container({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Hide4063();
  }
}

class Hide4063 extends StatefulWidget {
  const Hide4063({Key? key}) : super(key: key);
  @override
  State<Hide4063> createState() => _Hide4063State();
}

final hide4063InputBorderColor =
    const HSLColor.fromAHSL(0.8, 266, 0.76, 0.54).toColor();

final hide4063InputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: hide4063InputBorderColor,
    width: 2,
  ),
);

class _Hide4063State extends State<Hide4063> {
  late TextEditingController _controller;
  Color hide4063ButtonColor = const Color.fromRGBO(0xff, 0xff, 0xff, 0);
  Color hide4063ButtonTextColor = const Color.fromRGBO(0xff, 0xff, 0xff, 1);
  static const hide4063ButtonAnimationDuration = Duration(milliseconds: 1000);
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "aaaa";
  }

  void onHide4063Pressed() {
    setState(() {
      _controller.text = "asdasdasd";
      hide4063ButtonColor = const Color.fromRGBO(0xff, 0xff, 0xff, 1);
      hide4063ButtonTextColor = const Color.fromRGBO(0x00, 0x00, 0x00, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const TypingAnimationContainer(),
          AnimatedContainer(
            duration: hide4063ButtonAnimationDuration,
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              decoration: InputDecoration(
                border: hide4063InputBorder,
                enabledBorder: hide4063InputBorder,
                focusedBorder: hide4063InputBorder,
                fillColor: const Color.fromRGBO(0, 0, 0, 0.3),
                filled: true,
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: onHide4063Pressed,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(-1)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    image: DecorationImage(
                      image: const AssetImage("images/hide4063.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        hide4063ButtonColor,
                        BlendMode.lighten,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    "生成する！",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
              ),
              IconButton(
                onPressed: onHide4063Pressed,
                icon: Image.asset("images/hide4063.jpg"),
              ),
              InkWell(
                onTap: onHide4063Pressed,
                child: Image.asset("images/hide4063.jpg"),
              ),
              RaisedButton(
                onPressed: onHide4063Pressed,
                shape: CircleBorder(),
                child: ClipOval(
                  child: Image(
                    width: 30,
                    image: AssetImage("images/hide4063.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                ),
                onPressed: onHide4063Pressed,
                icon: Image.asset(
                  "images/hide4063.jpg",
                  width: 30,
                ),
                label: const Text("生成する！"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
