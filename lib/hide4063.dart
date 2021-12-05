import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'typing.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import "hide4063dataset.dart";

class Hide4063Typing extends StatelessWidget {
  const Hide4063Typing({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final titleList = displayHide4063Strings();
    return TypingAnimationContainer(
      titleList: titleList,
    );
  }
}

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

class _Hide4063State extends State<Hide4063> {
  static final hide4063InputBorderColor =
      const HSLColor.fromAHSL(0.8, 266, 0.76, 0.54).toColor();

  static final hide4063InputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: hide4063InputBorderColor,
      width: 2,
    ),
  );
  late TextEditingController _controller;
  String url = "https://twitter.com/akimasa_l";
  Color hide4063ButtonColor = const Color.fromRGBO(0xff, 0xff, 0xff, 0);
  Color hide4063ButtonTextColor = const Color.fromRGBO(0xff, 0xff, 0xff, 1);
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = "aaaa";
  }

  Future<void> onCopy() async {
    final data = ClipboardData(text: _controller.text);
    await Clipboard.setData(data);
  }

  void onHide4063Pressed() {
    setState(() {
      final textarea = createTextarea(createMessage(), createHashtags());
      _controller.text = textarea;
      url = createTweet(textarea);
      hide4063ButtonColor = const Color.fromRGBO(0xff, 0xff, 0xff, 1);
      hide4063ButtonTextColor = const Color.fromRGBO(0x00, 0x00, 0x00, 1);
    });
  }

  void _launchUniversalLink() async {
    // const url = 'https://www.youtube.com/';
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
    /* if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'このURLにはアクセスできません';
    } */
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Hide4063Typing(),
          Container(
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
          Container(
            margin: const EdgeInsets.all(10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                ElevatedButton.icon(
                  /* style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                  ), */
                  style: ElevatedButton.styleFrom(
                    primary: /* Theme.of(context)
                        .copyWith(
                          primaryColorLight: */
                        Colors.white,
/*                         )
                        .primaryColor, */
                    padding: const EdgeInsets.all(10),
                    onPrimary: Colors.black45,

                    /* side: const BorderSide(
                      width: 1,
                      color: Colors.white,
                    ), */
                  ),
                  /* style: Theme.of(context)
                      .elevatedButtonTheme
                      .style, //MaterialAppで設定したthemeを参照する */
                  onPressed: onCopy,
                  icon: const Icon(
                    Icons.content_copy,
                    size: 36.0,
                  ),
                  label: const Text("クリップボードにコピーする"),
                ),
                /* ElevatedButton.icon(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                  ),
                  onPressed: onHide4063Pressed,
                  icon: Image.asset(
                    "images/hide4063.jpg",
                    width: 30,
                  ),
                  label: const Text("生成する！"),
                ), */
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/hide4063.jpg"),
                      fit: BoxFit.cover,
                      /*    colorFilter: ColorFilter.mode(
                          hide4063ButtonColor,
                          BlendMode.lighten,
                        ), */
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: TextButton(
                    child: const Text(
                      "生成する！！",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: onHide4063Pressed,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _launchUniversalLink,
                  icon: const Icon(FontAwesomeIcons.twitter),
                  label: const Text("Twitterでシェアする！"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.all(10),
                    onPrimary: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
