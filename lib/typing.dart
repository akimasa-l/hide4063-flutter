import 'package:flutter/material.dart';
import 'dart:async';

const defaultTyping = [
  "Default Typing1",
  "Default Typing2",
  "Default Typing3",
  "Default Typing4",
  "Default Typing5",
  "Default Typing6",
  "Default Typing7",
  "Default Typing8",
  "Default Typing9",
];
const defaultPausingCount = 16; //一文字あたりのタイピングスピードの何倍待つか
const defaultTypingAnimationDuration = Duration(milliseconds: 100);

class TypingAnimationContainer extends StatelessWidget {
  //stateless widgetで囲むとconst宣言できる
  const TypingAnimationContainer({
    Key? key,
    this.titleList = defaultTyping,
    this.pausingCount = defaultPausingCount,
    this.typingAnimationDuration = defaultTypingAnimationDuration,
  }) : super(key: key);
  final List<String> titleList;
  final int pausingCount;
  final Duration typingAnimationDuration;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: TypingAnimation(
        titleList: titleList,
        pausingCount: pausingCount,
        typingAnimationDuration: typingAnimationDuration,
      ),
    );
  }
}

class TypingAnimation extends StatefulWidget {
  TypingAnimation({
    Key? key,
    this.titleList = defaultTyping,
    this.pausingCount = defaultPausingCount,
    this.typingAnimationDuration = defaultTypingAnimationDuration,
  })  : _titleIterator = titleList.iterator, // titleIteratorを初期化する
        assert(
          titleList.isNotEmpty,
          "title must not be empty",
        ),
        super(key: key) {
    //これはcurrentを呼ぶ前に必ずしなければいけないらしい
    _titleIterator.moveNext();
  }

  final List<String> titleList;
  final Iterator<String> _titleIterator;
  final int pausingCount;
  final Duration typingAnimationDuration;

  @override
  State<TypingAnimation> createState() => _TypingAnimationState();
}

class _TypingAnimationState extends State<TypingAnimation> {
  bool _isTyping = true;
  int _characters = 0; // 何文字目か
  bool _isForward = true; // 文字追加中か
  late int _pausingCount;
  String _displayString = "";
  bool _isEnd = false;
  double opacity = 1.0;

  void changeAnimation(Timer timer) {
    if (!_isEnd) {
      setState(() {
        if (_isTyping) {
          // もしタイピング中で(文字数が変化していたら)
          if (_isForward) {
            // もし文字数がどんどん増えていく方針だったら
            if (_characters ==
                widget._titleIterator.current.characters.length) {
              // もし文字数が限界まで来たら
              _isTyping = false; //タイピングを中止する
              _isForward = false; //文字数を減らす方向にシフトする
            } else {
              //もし文字数がまだ増やせるなら
              _characters++; //文字数を増やす
            }
          } else {
            //もし文字数がどんどん減っていく方針だったら
            if (_characters == 0) {
              //もし文字数が限界で0になったら
              _isForward = true; //文字数を増やす方向にシフトする
              if (!widget._titleIterator.moveNext()) {
                //もしこれ以上titleに表示する文字列がなかったら
                _displayString = defaultTyping[0];
                _isEnd = true;
                timer.cancel(); //timerをキャンセルしてアニメーションをしない
              }
            } else {
              //まだ文字数が減らせるなら
              _characters--; //文字数を減らす
            }
          }
        } else {
          //もしタイピング中でなくて止まってカーソルキーをパチパチさせてたら
          if (_pausingCount == 0) {
            //もし止まるカウントが0なら
            _isTyping = true; //タイピングを開始させる
            _pausingCount = widget.pausingCount; //止まるカウントをもとに戻しとく
            opacity = 1.0;
          } else {
            //もしまだ止まるカウントを減らせるなら
            _pausingCount--; //減らしてみる
            int opacityCount = _pausingCount ~/ 4;
            if (opacityCount % 2 == 0) {
              opacity = 0.0;
            } else {
              opacity = 1.0;
            }
          }
        }
      });
    }
  }

  @override
  void initState() {
    _pausingCount = widget.pausingCount;
    Timer.periodic(widget.typingAnimationDuration, changeAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isEnd) {
      _displayString =
          widget._titleIterator.current.characters.take(_characters).string;
    }
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: _displayString),
          TextSpan(
            text: "|",
            style: TextStyle(
              color: Color.fromRGBO(0xff, 0xff, 0xff, opacity),
            ),
          ),
        ],
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 40,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
