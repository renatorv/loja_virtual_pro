import 'package:flutter/material.dart';
import 'package:loja_virtual_pro/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({this.iconData, this.title, this.page});

  final IconData iconData;
  final String title;
  // atributo para saber qual item foi clicado e redirecionar para a página correta.
  final int page;

  @override
  Widget build(BuildContext context) {
    // Recuperando a página atual
    final int curPage = context.watch<PageManager>().page;
    // Como esse valor vai alterar o estado do Drawer (vai mudar a cor do elemento),
    // deve-se usar o "watch"

    return InkWell(
      onTap: () {
        // debugPrint('Toquei.: $page');
        context.read<PageManager>().setPage(page);
        // sempre que for usar o context dentro de uma função
        // deve-se usar o "read"
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? Colors.red : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? Colors.red : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
