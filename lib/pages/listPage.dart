import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({super.key, this.title=' '});


  @override
  _ListPageState createState() => _ListPageState(); 
 }

class _ListPageState extends State<ListPage> {
  List<String> searchResults=[];
  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[900],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchResults.clear();
                searchController.clear();
              });
          }, icon: Icon(Icons.clear),
          )
        ],
        
      ),
      body: Column(
        children: [ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
            onChanged: (value) {
              setState(() {
                searchResults.clear();
                if(value.isNotEmpty){
                  //buraya apı çağırıcaz
                  //şimdilik liste başlığından arama yapıyor
                  searchResults=[widget.title];
                }
              });
            },
            decoration: InputDecoration(
              labelText: 'Ürün Ara',
              border: OutlineInputBorder(),
            ),
            ),
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: searchResults.isEmpty ? 1:searchResults.length,
            itemBuilder:(BuildContext context, int index) {
              return ListTile(
                title: Text(
                  searchResults.isEmpty
                  ? 'Liste İçeriği'
                  :'Arama Sonucu:${searchResults[index]}',
                ),
              );
            }
             ))

          
        ],
      ),

    );
  }
}