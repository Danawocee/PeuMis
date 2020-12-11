import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

void main(){
	 runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
	var _visible =true;
	AnimationController animationController;
	Animation<double> animation;

	startTime() async{
		var _duration = new Duration(seconds: 5);
		return new Timer(_duration, navigationPage);
	}

	void navigationPage() {
		Navigator.of(context).pushReplacementNamed('SignIn');
	}

	@override
	void initState() {
		super.initState();
		animationController = new AnimationController(
				vsync: this, duration: new Duration(seconds: 5));
		animation =
		new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
		animation.addListener(() => this.setState(() {}));
		animationController.forward();

		setState(() {
			_visible = !_visible;
		});
		startTime();
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				fit: StackFit.expand,
				children: <Widget>[
					new Column(
						mainAxisAlignment: MainAxisAlignment.end,
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[
							Padding(
									padding: EdgeInsets.only(bottom: 30.0),
									child: new Image.asset(
										'assets/images/cctlgog.jpg',
										height: 25.0,
										fit: BoxFit.scaleDown,
									))
						],
					),
					new Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							new Image.asset(
								'assets/images/index.png',
								width: animation.value * 250,
								height: animation.value * 250,
							),
						],
					),
				],
			),
		);
	}

	Future<void> connectionCheck() async {
		try {
			final result = await InternetAddress.lookup('google.com');
			if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
				print('connected');
			}
		} on SocketException catch (_) {
			print('not connected');
		}
	}
  
}
