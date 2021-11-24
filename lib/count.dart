import 'package:flutter/material.dart';
class TK extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TKState();
  }
}
class TKState extends State<TK> {
  bool? check = false;
  bool? checkboxSelected = false;
  int gdr=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          new Row(
            children: [
              new Container(
                padding: EdgeInsets.only(left:170),
                child: new Text("更改跟单人",
                  style:TextStyle(
                    fontSize: 20,
                  )
                  ,

                ),
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: new Container(

                  margin: EdgeInsets.only(left:100,top:5),
                  color:Colors.blue,
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.only(left:10,top:2),
                  constraints: BoxConstraints(maxHeight: 300),//设置maxHeight为你想要的数字就行

                  child: new Text("×",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),),
                  //decoration: BoxDecoration(
                  //borderRadius:BorderRadius.circular(3),
                  //),
                ),
              ),

            ],

          ),
          SizedBox(height:10),
          new Row(
            children: [
              new Container(
                child: new Text("客户"),
                width: 30,
                height: 30,
                color: Colors.grey,

              ),
              new Container(
                margin: EdgeInsets.only(left:10,right: 70),
                child: new Column(
                  children:[
                    new Row(
                      children: [
                        new Text("无敌无敌"),
                        new Container(
                          child: new Text("老板",
                            style:TextStyle(
                                fontSize: 10
                            ),
                          ),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(3),

                          ),
                        ),
                      ],
                    ),

                    new Text("13660942014"),
                  ],

                ),
              ),

              Checkbox(

                  value: checkboxSelected,
                  onChanged: (value){
                    if(value==true){
                      check=false;
                    }
                    checkboxSelected = value;
                    setState((){
                       Navigator.of(context).pop();
                    });
                  }
    //Navigator.of(context).pop();
              ),

            ],
          ),
          SizedBox(height: 10),
          new Row(
            children: [
              new Container(
                child: new Text("客户"),
                width: 30,
                height: 30,
                color: Colors.grey,

              ),
              new Container(
                margin: EdgeInsets.only(left:10,right: 70),
                child: new Column(
                  children:[
                    new Row(
                      children: [
                        new Text("无敌无敌"),
                        new Container(
                          child: new Text("老板",
                            style:TextStyle(
                                fontSize: 10
                            ),
                          ),
                          width: 20,
                          height: 20,
                          color: Colors.grey,

                        ),
                      ],
                    ),

                    new Text("13660942014"),
                  ],

                ),
              ),

              Checkbox(

                  value: check,
                  onChanged: (value){
                    if(value==true){
                      checkboxSelected=false;
                    }

                    check = value;
                    setState((){

                    });
                  }
              ),

            ],
          ),
         GestureDetector(
            onTap: (){

            },
           child: new Container(
             margin: EdgeInsets.only(top: 380),
             padding: EdgeInsets.only(left: 160,top: 10),
             width: 350,
             height: 40,
             child: new Text("确定",
               style: TextStyle(
                   color: Colors.white
               ),),
             decoration: BoxDecoration(
                 color: Colors.blue,
                 borderRadius: BorderRadius.circular(15)
             ),
           ),
          ),


        ],
      ),
    );

  }

}
