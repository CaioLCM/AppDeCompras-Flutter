import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/models/product_list.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(_formData.isEmpty){
      final arg = ModalRoute.of(context)?.settings.arguments;

      if(arg != null){
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile =
        url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(context, listen: false).saveProduct(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulário de Produto",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [IconButton(onPressed: _submitForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['name']?.toString(),
                decoration: InputDecoration(labelText: "Nome"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (_name) {
                  final name = _name ?? '';
                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório!';
                  }
                  if (name.trim().length < 3) {
                    return "Nome precisa no mínimo de 3 letras";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['price']?.toString(),
                decoration: InputDecoration(labelText: "Preço"),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                keyboardType: TextInputType.numberWithOptions(),
                onFieldSubmitted:
                    (_) => FocusScope.of(context).requestFocus(_descriptionFocus),
                onSaved:
                    (price) => _formData['price'] = double.parse(price ?? '0'),
                validator: (_price){
                  final priceString = _price ?? '';
                  final price = double.tryParse(priceString) ?? -1;
                  if(price <= 0){
                    return "Informe um preço válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['description']?.toString(),
                decoration: InputDecoration(labelText: "Descrição"),
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved:
                    (description) => _formData['description'] = description ?? '',
                validator: (_description) {
                  final description = _description ?? '';
                  if (description.trim().isEmpty) {
                    return 'Descrição é obrigatória!';
                  }
                  if (description.trim().length < 10) {
                    return "Descrição precisa no mínimo de 10 letras";
                  }
                  return null;
                },
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Url da Imagem"),
                      focusNode: _imageUrlFocus,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      onSaved:
                          (imageUrl) => _formData['imageUrl'] = imageUrl ?? '',
                      onFieldSubmitted: (_) => _submitForm(),
                    validator: (_imageUrl){
                      final imageUrl = _imageUrl ?? '';
                      if(!isValidImageUrl(imageUrl)){
                        return "Informe uma Url válida!";
                      };
                      return null;
                    },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child:
                        _imageUrlController.text.isEmpty
                            ? Text("Informe a Url")
                            : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(_imageUrlController.text),
                            ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
