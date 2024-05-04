import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({super.key, required this.title});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<String> items = ['Elma (2 kg)', 'Armut (5 adet)', 'Muz (1 kg)'];  // default product list
  String selectedUnit = 'Seçiniz';  // default unit
  List<String> units = ['Seçiniz','None','kg', 'adet'];  // unit options

  void _showAddProductDialog() {
    TextEditingController productNameController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Yeni Ürün Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(
                  labelText: 'Ürün Adı',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'Miktar',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,  // only enter number
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedUnit,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birim',
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedUnit = newValue!;
                  });
                },
                items: units.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('İptal')
            ),
            TextButton(
              onPressed: () {
                if (productNameController.text.isNotEmpty && quantityController.text.isNotEmpty) {
                  _addProductToList(productNameController.text, quantityController.text, selectedUnit);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Ekle')
            )
          ],
        );
      }
    );
  }

  void _addProductToList(String productName, String quantity, String unit) {
    setState(() {
      if(unit== 'None' || unit=='Seçiniz'){
        items.add(productName);
      }
      else{
      items.add('$productName ($quantity $unit)');
  }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index])
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        tooltip: 'Ürün Ekle',
        child: Icon(Icons.add),
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
