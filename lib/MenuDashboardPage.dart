import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final Color backgroundColor = Colors.white;
var assetImage = AssetImage('assets/images/snow.jpg');
var image = Image(image: assetImage);
class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuscaleAnimation;
  Animation<Offset> _slideAnimation;
  //Animation<Offset> _imageslideAnimation;

  void initState(){
    super.initState();
    _controller =  AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin:1,end:0.6).animate(_controller);
    _menuscaleAnimation = Tween<double>(begin:0.5,end:1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1,0),end: Offset(0,0)).animate(_controller);
    //_imageslideAnimation = Tween<Offset>(begin: Offset(-1,0),end: Offset(0,0)).animate(_controller);

  }

  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Stack(
        children: <Widget>[
          menu(context),
          Dashboard(context),
        ],


      ),
    );
  }

  Widget menu(context)  {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuscaleAnimation ,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 26.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(

              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  padding: const EdgeInsets.only(left:80),
                  height: 150,
                  width: 150,

                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/snow.jpg'),
                      fit: BoxFit.cover),
                      shape: BoxShape.circle,

                          ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text("Prayant Gupta",style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                  ),
                ),
                Divider(
                  height: 64,
                  thickness: 1,
                  color: Colors.black,
                  indent:10,
                  endIndent: 10,
                ),
                Text("About Me", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),),
                SizedBox(height: 10),
                Text("Qualifications", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),),
                SizedBox(height: 10),
                Text("Projects", style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20),),
                SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top:0,//isCollapsed ? 0 : 0.2 *screenHeight ,
      bottom:0,//isCollapsed ? 0 :0.2*screenHeight,
      left:isCollapsed ? 0 :0.5*screenWidth,
      right:isCollapsed ? 0 : -0.5*screenWidth,

      child:ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius:  isCollapsed ? null :BorderRadius.all(Radius.circular(50)),
          shadowColor: Colors.blueAccent, 
          elevation: 10.0,
          child:Container(
            padding: const EdgeInsets.only(left:1,right:1,top:48),
            decoration: BoxDecoration(
                borderRadius:  isCollapsed ? null :BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                image: AssetImage('assets/images/snow.jpg',),
               
               fit: BoxFit.cover,
                
              )
            ),

            child:Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget>[
                      InkWell(
                          child:  Icon( isCollapsed ?Icons.menu : Icons.arrow_back_ios, color: Colors.white)  ,
                          onTap:(){
                            setState((){
                              if(isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();
                              isCollapsed = !isCollapsed;
                            }
                            );
                          }
                      ),
                      //SizedBox(width: 80,),
                      Container(
                        padding: const EdgeInsets.only(left:60 ),
                        child: Text("My Resume", style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w900,),
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: screenHeight/30),
                Container(

                  height:screenHeight*(4/5),
                  child: PageView(
                    controller: PageController(viewportFraction: 0.9),
                    scrollDirection: Axis.horizontal,
                    //pageSnapping: true,
                    children: <Widget>[
                      Container(
                        decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(35)),color:Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.person_outline,size: 25),
                                  Text(" About Me",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900),)
                              ],
                            ),

                          ],

                           ),
                        ),

                      Container(
                        decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color:Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        //color: Colors.blueAccent,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.school,size: 25),
                                Text(" Education",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900),)
                              ],
                            ),

                          ],

                        ),
                      ),//2
                      Container(
                        decoration : BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)),color:Colors.white,
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        //color: Colors.greenAccent,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(Icons.person_pin,size: 25),
                                Text(" Positions",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w900),)
                              ],
                            ),

                          ],

                        ),
                      ),//3
                    ],
                  ),

                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}

