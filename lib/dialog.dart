import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
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
              child: Text('SimpleDialog'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Text('SimpleDialog'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context),
                        child: Text('list of SimpleDialog'),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
