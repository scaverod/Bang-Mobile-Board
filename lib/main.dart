import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BangPage(),
        ),
      ),
    ),
  );
}

class BangPage extends StatefulWidget {
  @override
  _BangPageState createState() => _BangPageState();
}

class _BangPageState extends State<BangPage> {
  Image img;
  Image imgUp = Image.asset('assets/images/button.png');
  Image imgDown = Image.asset('assets/images/button-pressed.png');
  Image imgBeer = Image.asset('assets/images/beer.png');
  Image imgLive = Image.asset('assets/images/live.png');
  List<bool> lives = [false, false, false, false, false];
  List<Image> images = List<Image>.filled(5 ,null , growable: false);
  static AudioCache player = new AudioCache();
  static const drinkAudioPath = "sounds/drink.mp3";
  static const screamAudioPath = "sounds/scream.mp3";
  static const shootAudioPath = "sounds/shoot.mp3";

  @override
  void initState() {
    super.initState();
    img = imgUp;
    images[0] = imgBeer;
    images[1] = imgBeer;
    images[2] = imgBeer;
    images[3] = imgBeer;
    images[4] = imgBeer;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: img,
                onTapDown: (tap) {
                  setState(() {
                    img = imgDown;
                    player.play(shootAudioPath);
                  });
                },
                onTapUp: (tap) {
                  setState(() {
                    img = imgUp;
                  });
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: images[0],
                    onPressed: () {
                      lives[0] = !lives[0];
                      lives[0] ? player.play(drinkAudioPath) : player.play(screamAudioPath);
                      setState(() {
                        images[0] = lives[0] ? imgLive : imgBeer;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: images[1],
                    onPressed: () {
                      lives[1] = !lives[1];
                      lives[1] ? player.play(drinkAudioPath) : player.play(screamAudioPath);
                      setState(() {
                        images[1] = lives[1] ? imgLive : imgBeer;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: images[2],
                    onPressed: () {
                      lives[2] = !lives[2];
                      lives[2] ? player.play(drinkAudioPath) : player.play(screamAudioPath);
                      setState(() {
                        images[2] = lives[2] ? imgLive : imgBeer;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: images[3],
                    onPressed: () {
                      lives[3] = !lives[3];
                      lives[3] ? player.play(drinkAudioPath) : player.play(screamAudioPath);
                      setState(() {
                        images[3] = lives[3] ? imgLive : imgBeer;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: images[4],
                    onPressed: () {
                      lives[4] = !lives[4];
                      lives[4] ? player.play(drinkAudioPath) : player.play(screamAudioPath);
                      setState(() {
                        images[4] = lives[4] ? imgLive : imgBeer;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
