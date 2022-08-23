import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ichinggo/view/frame_view.dart';
import 'package:ichinggo/view/home_view.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FrameView());
      default:
        return _errorRoute();
    }
    
  }
  
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error Page'),
        ),
      );
    });
  } 
}