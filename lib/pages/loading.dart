import 'package:flutter/material.dart';
import 'package:worldtime/services/space_launches.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupLaunches() async {
    SpaceLaunches instance = SpaceLaunches(launch: 'next', launchUrl: 'next');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'mission': instance.mission,
      'time': instance.time,
      'year': instance.year,
      'patch': instance.patch,
    });
  }

  @override
  void initState() {
    super.initState();
    setupLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitThreeBounce(
        color: Colors.black,
        size: 50.0,
      )),
    );
  }
}
