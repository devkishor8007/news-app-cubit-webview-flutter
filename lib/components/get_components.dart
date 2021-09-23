import 'package:flutter/material.dart';
import 'package:read_me_flutter_app/modules/web_view/web_view_screen.dart';

Widget showDataListViewBuilder(List<dynamic> listData, Size size) {
  return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => WebViewScreen(
                  url: listData[index]['url'],
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                      height: size.height * 0.16,
                      width: size.width * 0.3,
                      decoration: listData[index]['urlToImage'] != null
                          ? BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${listData[index]['urlToImage']}'),
                                fit: BoxFit.cover,
                              ),
                            )
                          : const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1503008201115-c8ae903771cb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'),
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                  child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        listData[index]['title'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    Text('${listData[index]['publishedAt']}'),
                  ],
                ),
              )),
            ],
          ),
        );
      });
}
