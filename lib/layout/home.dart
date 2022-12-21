import 'package:flutter/material.dart';
import 'package:news_c7_sun/shared/network/remote/api_manager.dart';

import '../models/sources_response.dart';
import '../screens/tab_controller.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/pattern.png',
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('News'),
          backgroundColor: Colors.green,
          elevation: 0.0,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        ),
        body: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.data?.message ?? "");
            }
            if (snapshot.data?.status != 'ok') {
              return Center(child: Text(snapshot.data!.message!));
            }
            var sources = snapshot.data?.sources ?? [];
            return TabControllerScreen(sources);
          },
        ),
      ),
    );
  }
}
