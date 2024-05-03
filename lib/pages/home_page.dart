

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{
   List<String> shoppingLists=[
    'Liste 1',
    'Liste 2',
    'Liste 3',

   ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uygulama Adı',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
        backgroundColor: Colors.red[900],
        elevation:0,
        ),
        body: 
        Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: const Text('Listelerim',
              style: TextStyle(fontSize: 24.0,color: Colors.black),
              ),
            ),
            
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
              itemCount: shoppingLists.length,
              itemBuilder: (BuildContext context,int index){
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  direction: Axis.horizontal,
                 
                  child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),  
                    color: Colors.red[900],
                    ),
                    child: ListTile(
                      title: Text(shoppingLists[index]),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> ListPage(title:shoppingLists[index])) ,);
                      },
                    ),
                  ),
                ),
                secondaryActions:<Widget> [
                  IconSlideAction(
                    caption: 'Sil',
                    color:Colors.red[400],
                    icon:Icons.delete_outline,
                    onTap: () {
                      setState(() {
                        shoppingLists.removeAt(index);
                      });
                    },
                  ),
                ],
                );
              },
              ),
            ),
           ]
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _showAddListDialog(context);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.red[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
);
       
  }
  
  void _showAddListDialog(BuildContext context) {
    TextEditingController listNameController=TextEditingController();
    showDialog(
      context: context,
       builder: (BuildContext context){
        return AlertDialog(
          title: Text("Yeni Liste Oluştur"),
          content: TextField(
            controller:listNameController,
            decoration: InputDecoration(labelText: "Liste Adı"),
          ),
          actions: [
            TextButton(onPressed: () {
              
            Navigator.of(context).pop();
            },
            child: Text("İptal",
            style: TextStyle(
            color: Colors.black,
            fontSize: 18),),
            
            style:TextButton.styleFrom(
              backgroundColor: Colors.red[900],
              //primary:Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            ),
        
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: TextButton(
                onPressed: (){
                String listName=listNameController.text;
                setState((){
                  shoppingLists.add(listName);
                });
                Navigator.of(context).pop();
              }, 
              child: Text("Kaydet",
              style: TextStyle(
              color: Colors.black,
              fontSize: 18),),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              
              ),
            ),
          ],
        );
       }
       );
  }
}
class ListPage extends StatelessWidget {
  final String title;

  const ListPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(title),
        backgroundColor: Colors.red[900],
        elevation:0,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Text('Liste Sayfası', style: TextStyle(fontSize: 24.0),)
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed:(){
      //ekleme butonuna basınca yapılacak işlemler
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.red[900],
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
