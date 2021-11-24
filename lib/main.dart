import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'count.dart';
//import 'dart:async';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: ()=> Navigator.of(context).pop
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new Text(
            '客户',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        body:new kehu(),
      ),
    );
  }
}

class kehu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return kehuState();
  }
}
class kehuState extends State<kehu> {
  bool flag = false;
  int select = 0;
  //定义输入框---------
  double num=0.00;
  bool? checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //1
          new Row(
            children: [
              new Text("姓名客户"),

              Container(

                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入',
                  ),
                ),
                // color: Colors.grey,
                width: 100,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 240, top: 0),

              ),
            ],
          ),

          //2
          new Row(
            children: [
              new Text("手机号码"),

              Container(

                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '请输入',
                  ),
                ),
                // color: Colors.grey,
                width: 60,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 240, top: 0),

              ),
              new Icon(
                Icons.star,
                color: Colors.blue,
              ),
            ],
          ),

          //3
          new Row(
            children: [
              new Text("默认税率"),
              new GestureDetector(
                onTap: (){
                  //弹框
                  showDialog<Null>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text('税率'),
                        content: new SingleChildScrollView(
                          child: new ListBody(
                            children: <Widget>[
                              new Row(

                                  children: <Widget>[
                                    Container(
                                      padding:EdgeInsets.only(left:5,top:5),
                                      margin: EdgeInsets.only(left:50),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular((4)),
                                          color: Colors.grey
                                      ),

                                      child:Text("0"),
                                      height: 30,
                                      width:20,

                                    ),
                                    Container(
                                      child: new Text('.'),
                                      // color: Colors.grey,
                                      padding:EdgeInsets.only(top: 7),
                                      margin: EdgeInsets.only(left:20),
                                      height: 30,
                                      width:10,
                                    ),


                                    Container(

                                      padding:EdgeInsets.only(left:21,top:13),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular((4)),
                                          color: Colors.grey
                                      ),
                                      margin: EdgeInsets.only(left:20),
                                      //--------------
                                      child: TextField(
                                        //
                                        controller: TextEditingController(text: "$num"),
                                        //输入框限制
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter.digitsOnly,//只允许输入数字
                                          LengthLimitingTextInputFormatter(2)
                                        ],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,//去掉输入框底下的横线
                                          hintText: "0",
                                        ),
                                        //记住上一次的输入值
                                        onChanged: (text) {
                                          var n = double.tryParse(text);
                                          if (n != null) {
                                            num = n;
                                          }
                                        },
                                      ),
                                      height: 30,
                                      width:50,
                                    ),
                                  ]

                              ),


                            ],
                          ),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('取消',
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(width: 60),

                          new FlatButton(
                            child: new Text('确定',
                              style: TextStyle(
                                  color: Colors.blue
                              ),),
                            onPressed: () {
                              setState(() {

                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ).then((val) {
                    print(val);
                  });
                },
                child: Container(
                  child:new Text(" $num >"),
                  width: 60,
                  height: 50,
                  margin: EdgeInsetsDirectional.only(start: 290, top: 0),

                ),
              ),

            ],
          ),


          //4
          new Row(
            children: [
              new Text("跟单人"),
              new GestureDetector(
                onTap: (){
                  //
                  showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      constraints: BoxConstraints(maxHeight: 600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),


                      builder: (BuildContext context) {
                        return TK();
                      });
                },
                child: Container(
                  child:new Text(" 0.00  >"),

                  width: 60,
                  height: 50,
                  margin: EdgeInsetsDirectional.only(start:290, top: 0),

                ),
              ),

            ],
          ),

          //5
          new Row(
            children: [
              new Text("客户等级",
              ),
              new GestureDetector(
                onTap: (){
                  setState(() {
                    select = 1;
                  });
                },

                child: Container(
                  padding: EdgeInsets.only(top:6.0,left: 2.0),
                  child:  Text("A销售价",),
                  margin: EdgeInsetsDirectional.only(start:100, top: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: select == 1 ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 60,
                  height: 40,
                ),
              ),



              GestureDetector(
                onTap: (){
                  setState(() {
                    select = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6.0,left: 2.0),
                  child:  Text("B拿货价",

                  ),
                  margin: EdgeInsetsDirectional.only(start:30, top: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: select == 2 ? Colors.blue : Colors.white,
                  ),
                  width: 60,
                  height: 40,
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    select = 3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top:6.0,left: 2.0),
                  child:  Text("C打包价",

                  ),
                  margin: EdgeInsetsDirectional.only(start:30, top: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: select == 3 ? Colors.blue : Colors.white,
                  ),
                  width: 60,
                  height: 40,
                ),
              ),
            ],
          ),

          //6
          new Row(
            children: [
              new Text("常用客户"),

              Container(

                child:Switch(
                  value: this.flag,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      this.flag = value;
                    });
                  },
                ),
                // color: Colors.grey,
                width: 100,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 250, top: 0),

              ),
            ],
          ),
        ],
      ),
      height: 400,
    );

  }
}

//扩展界面






