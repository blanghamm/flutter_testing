import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class SpaceLaunches {
  String launch;
  String time;
  String launchUrl = 'latest';
  String mission;
  String year;
  String patch;

  SpaceLaunches(
      {this.launch, this.time, this.launchUrl, this.mission, this.year});

  Future<void> getData() async {
    try {
      Response response = await get('https://api.spacexdata.com/v3/launches');
      Map data = jsonDecode(response.body);
      String launchTime = data['launch_date_local'];
      String launchName = data['mission_name'];
      String launchYear = data['launch_year'];
      String launchPatch = data['links']['mission_patch'];
      DateTime now = DateTime.parse(launchTime);
      year = launchYear.toString();
      mission = launchName.toString();
      time = DateFormat.jm().format(now);
      patch = launchPatch.toString();
    } catch (e) {
      time = 'error!';
      mission = 'error!';
      year = 'error!';
      patch = 'error!';
    }
  }
}
