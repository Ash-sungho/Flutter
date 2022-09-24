import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  State<HttpApp> createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  List? data;
  TextEditingController? _editingController;

  ScrollController? _scrollController;
  int page = 1;

  Future<void> _launchUrl(url) async {

    var parseUrl = Uri.parse(url);

    if (!await launchUrl(parseUrl, mode:LaunchMode.externalNonBrowserApplication )) {
      throw 'Could not launch';
    }

  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController?.value.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 44a2ff59fcf9790163e208bf26e72657"});
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data!.addAll(result);
    });
    return response.body;
  }

  Widget selectImage(url) {
    print('=====> $url');
    if (url == '') {
      return Image.asset(
        'assets/images/noImage.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        url,
        height: 100,
        width: 100,
        fit: BoxFit.contain,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    data = List.empty(growable: true);
    _editingController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              (_scrollController!.position.maxScrollExtent - 200) &&
          !_scrollController!.position.outOfRange) {
        debugPrint('Bottom');
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data!.clear();
          getJSONData();
        },
        child: const Icon(Icons.file_download),
      ),
      appBar: AppBar(
        title: TextField(
          controller: _editingController,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
        ),
      ),
      body: Center(
          child: data!.isEmpty
              ? const Text('데이터가 없습니다.',
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
              : ListView.builder(
                  controller: _scrollController,
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      key: UniqueKey(),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            selectImage(data![index]['thumbnail'].toString()),
                            Container(
                              width: MediaQuery.of(context).size.width - 110,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data![index]['title'].toString(),
                                  ),
                                  Text(
                                      '저자 : ${data![index]['authors'].toString()}'),
                                  Text(
                                      '가격 : ${data![index]['sale_price'].toString()}'),
                                  Text(
                                      '판매상태 : ${data![index]['status'].toString()}'),
                                  InkWell(
                                    child: Text(
                                      '판매링크 : ${data![index]['url'].toString()}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () {
                                      _launchUrl(data![index]['url']);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
