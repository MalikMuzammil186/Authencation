import 'package:flutter/material.dart';
import 'package:flutter_fir_base_auth_demo2/view/HomePage/Widgets/home_widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String name = '/';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(title:const  Text(" HOME PAGE "),centerTitle: true,backgroundColor: Colors.greenAccent,),
      body:const Center(child: HomeWidget()),
    );
  }
}