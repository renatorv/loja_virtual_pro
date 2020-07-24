import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual_pro/screens/base/base_screen.dart';

Future<void> main() async {
  runApp(MyApp());

  /// ESCREVENDO....

  /// Firestore.instance.collection('teste').add({'teste': 'teste'});

  /// Faz a gravação no Firestore, sem gravar o nome do documento, usando um valor aleatório
  //Firestore.instance.collection('pedidos').add({'preco': 199.99, 'usuario': 'Renato'});

  /// ATENÇÃO: o setData, grava no documento da forma como é passado para ele.
  /// EX.: caso desejar atualizar o campo e passar somente o preco, o registro no Firestore ficará somente com o campo preço.
  /// Nesse caso, usar o updateData conforme abaixo

  /// Gravando com o nome do documento
  //Firestore.instance.collection('pedidos').document('#00001').setData({'preco': 199.99, 'usuario': 'Renato'});

  /// Atualizando os dados, deve-se acessar o msm documento
  //Firestore.instance.collection('pedidos').document('#00001').setData({'preco': 199.99, 'usuario': 'Renato Alves'});

  /// Atualizando dados especificos
  //Firestore.instance.collection('pedidos').document('#00001').updateData({'preco': 199.99, 'usuario': 'Renato Alves'});

  /// Utilizando uma nomenclatura de pastas
  //Firestore.instance.document('pedidos/#00001').updateData({'preco': 199.99, 'usuario': 'Renato Alves'});

  /// Subcoleções
  //Firestore.instance.collection('pedidos').document('#00001').collection('colecao').document('documento').collection('colecao2').document('documento2');

  ///=============================================================================================================================================================
  ///
  ///LENDO
  ///
  //DocumentSnapshot document = await Firestore.instance.collection('usuarios').document('adsf45ds64erw48716adsf').get();

  //debugPrint(document.data['nome'].toString());

  ///=============================================================================================================================================================
  ///
  ///MONITORANDO DADOS NO FIREBASE
  ///
  // Firestore.instance.collection('usuarios').document('adsf45ds64erw48716adsf').snapshots().listen((document) {
  //   debugPrint(document.data.toString());
  // });

  ///=============================================================================================================================================================
  ///
  ///RECUPERANDO TODOS OS DOCUMENTOS DE UMA COLEÇÃO
  ///
  // QuerySnapshot snapshots = await Firestore.instance.collection('boletos').getDocuments();
  // //debugPrint(snapshots.documents.toString());
  // for (DocumentSnapshot document in snapshots.documents) {
  //   debugPrint(document.data.toString());
  // }

  ///MONITORANDO...
  Firestore.instance.collection('boletos').snapshots().listen((snapshot) {
    for (DocumentSnapshot document in snapshot.documents) {
      debugPrint(document.data.toString());
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja do Renato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
    );
  }
}
