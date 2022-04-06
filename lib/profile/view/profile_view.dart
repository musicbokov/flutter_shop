import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/l10n/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.green
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text('Артемий'),
                      Text('Левушкин'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Text(l10n.history,
                  style: const TextStyle(fontSize: 18)
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                itemBuilder: (context, item) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Заказ №12768', style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('387 Р', style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Трюфельный пай'),
                            Text('219 Р')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Маффин Три шоколада'),
                            Text('79 Р')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Lay\'s Бекон'),
                            Text('89 Р')
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
