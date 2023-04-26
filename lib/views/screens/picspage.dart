import 'package:flutter/material.dart';
import 'package:gallery_app_1/helpers/theme_controller.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';

class PicsPage extends StatefulWidget {
  String? category;

  PicsPage({super.key, this.category});

  @override
  State<PicsPage> createState() => _PicsPageState();
}

class _PicsPageState extends State<PicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photos"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: Icon(
              Icons.light,
              size: 35,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.getPics(widget.category!),
        builder: (context, snapShot) {
          Map? data = snapShot.data;
          if (snapShot.hasError) {
            return Center(
              child: Text("${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            return Center(
              child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${data!['hits'][index]['largeImageURL']}"),

                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                                  Colors.black.withOpacity(.4),
                                  Colors.black.withOpacity(.2),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
