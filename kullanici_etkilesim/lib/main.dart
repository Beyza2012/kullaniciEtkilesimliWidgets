import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kullanıcı Etkileşimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           ElevatedButton(onPressed: (){
           showDialog(
               context: context,
               builder: (BuildContext context){
                 return AlertDialog(
                   title: Text("Özel Alert",style: TextStyle(color: Colors.white)),
                   backgroundColor: Colors.indigoAccent,
                   content: SizedBox(
                     height: 80,
                     child: Column(
                       children: [
                         TextField(
                           controller: tfControl,
                           decoration: InputDecoration(
                             labelText: "Veri",
                           ),
                         ),
                       ],
                     ),
                   ),
                   actions: [
                     TextButton(onPressed: (){
                     Navigator.pop(context);
                       },
                         child: Text("İptal",style: TextStyle(color: Colors.white),)),
                     TextButton(onPressed: (){
                       String alinanVeri=tfControl.text;
                        print("Veri okundu $alinanVeri");
                        tfControl.text="";
                        Navigator.pop(context);
                     },
                         child: Text("Veri Oku",style: TextStyle(color: Colors.white))),
                   ],
                 );
               }
           );//showdialog

           }, child: Text("Alert Dialog")),
            ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Silmek İstiyor musunuz?",style: TextStyle(color: Colors.indigoAccent),),
                backgroundColor: Colors.grey,
                duration: Duration(seconds: 5),
                action: SnackBarAction(
                label: "Evet",
                textColor: Colors.red,
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Silindi")),
                  );
                },
              ) ,
              ),
            ) ;

            }, child: Text("Snackbar Action")),
            Text("Popup Menu:",style: TextStyle(color: Colors.purpleAccent,fontSize: 25)),
            PopupMenuButton(
               itemBuilder: (context)=>[
                 PopupMenuItem(
                   value: 1,
                   child: Text("SİL",style: TextStyle(color: Colors.red),),
                 ),
                 PopupMenuItem(
                   value: 2,
                   child: Text("Güncelle",style: TextStyle(color: Colors.indigo),),
                 ),
               ],
               onCanceled: (){
                 print("Seçim Yapılmadı");
               },
               onSelected: (menuItemValue){
                 if(menuItemValue==1){
                   print("Sil seçildi");
                 }
                 if(menuItemValue==2){
                   print("Güncelle seçildi");
                 }
               },
               child: Icon(Icons.open_in_new),

             ),
          ],
        ),
      ),

    );
  }
}
