import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              child: Text('Website'),
              onPressed: () {
                var url = 'https://github.com/WataruSuzuki';
                _launchUrl('$url');
              },
            ),
            RaisedButton(
              child: Text('Email'),
              onPressed: () {
                var email = 'test@example.com';
                var subject = Uri.encodeComponent('Hello');
                var body = Uri.encodeComponent('This is a test.');
                var url = 'mailto:$email?subject=$subject&body=$body';
                print(url);
                _launchUrl(url);
              },
            ),
            RaisedButton(
              child: Text('Phone'),
              onPressed: () {
                var tel = '117';
                _launchUrl('tel:$tel');
              },
            ),
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('(・A・)');
    }
  }
}
