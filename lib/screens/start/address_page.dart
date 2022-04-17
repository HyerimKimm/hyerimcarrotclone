import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyerimcarrotclone/utils/logger.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(3),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey
                ),
                hintText: '도로명으로 검색',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                prefixIconConstraints:
                  BoxConstraints(minWidth: 24, minHeight: 24),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton.icon(
                onPressed: (){ },
                icon: Icon(
                  CupertinoIcons.compass,
                   color: Colors.white,
                  size: 20,
                ),
                label: Text('현재 위치 찾기',
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                logger.d('index: $index');
                return ListTile(
                  trailing: ExtendedImage.asset('assets/imgs/abocado.PNG'),
                  title: Text('address $index'), 
                  subtitle: Text('address $index'),);
                },
              itemCount: 30,),
          )
        ],
      ),
    );
  }
}
