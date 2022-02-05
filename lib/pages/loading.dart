import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime newWorldTime =
        (WorldTime(location: 'Dhaka', flag: 'bangladesh.jpg', url: 'Asia/Dhaka'));
    await newWorldTime.getTime();
    
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': newWorldTime.location,
      'flag': newWorldTime.flag,
      'time': newWorldTime.time,
      'isDaytime': newWorldTime.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.blueGrey[200],
        size: 100.0,
      )),
    );
  }
}
