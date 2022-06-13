import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:side_menu/views/dashboard.dart';
import 'package:side_menu/views/sales.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter SPA',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/:page_name', page: () => MasterPage()),
      ]
      
    );
  }
}

class MasterPage extends StatelessWidget {
  late Widget InnerView; //Aqui eu permitir que a variável receba um valor posteriormente, pois se não o "MasterPage" da erro.
  MasterPage() {
     Map<String, Widget> InnterRoutes = {
      'home':Dashboard(),
      'sale':Sales(),  
    };
    InnerView = InnterRoutes[Get.parameters['page_name']]!; // Já aqui eu permitir que a variável fosse iniciada como null, "pelo menos é o que eu acho que fiz!"
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: DrawerHeader(
                        child: CircleAvatar(
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: 60,
                            ),
                          )
                      )
                    ),
                    ListTile(
                      hoverColor: Colors.white,
                      leading: Icon(Icons.menu),
                      title: Text('Dashboard'),
                      onTap: (){
                        Get.toNamed('/home');
                      },
                    ),
                    ListTile(
                      hoverColor: Colors.white,
                      leading: Icon(CupertinoIcons.square_favorites_alt),
                      title: Text('Sales'),
                      onTap: (){
                        Get.toNamed('/sale');
                      },
                    ),
                  ],
                )
              )
            ),
            Expanded(
              flex: 6,
              child: Container(color: Colors.white, child: InnerView)),
          ],)
      ),
    );
  }
}