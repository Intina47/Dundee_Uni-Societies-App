import 'package:flutter/material.dart';
import 'package:flutter_application_1/datamodel.dart';
import 'package:flutter_application_1/components/dataread.dart';
import 'package:flutter_application_1/screens/detailpage.dart';
import 'package:flutter_application_1/screens/login.dart';

class Search extends SearchDelegate {
  @override
  String query = '';
  List<Societiesdatamodel> listofSocieties = [];
  List<Societiesdatamodel> recentSearch = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  final SocietiesApi _societylist = SocietiesApi();
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Societiesdatamodel>>(
      future: _societylist.readJsonData(query: query),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<Societiesdatamodel>;
          return ListView.builder(
              itemCount: (items.length),
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  detaildatamodel: items[index])));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            SizedBox(
                              height: 100,
                              child: Ink.image(
                                image: NetworkImage(
                                    items[index].imageurl.toString()),
                                fit: BoxFit.fitWidth,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10, top: 5, right: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              Text(
                                items[index].description.toString(),
                                style: TextStyle(color: Colors.grey.shade500),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.orange,
                                    primary:
                                        const Color.fromARGB(255, 2, 15, 35),
                                    elevation: 20,
                                    side: const BorderSide(
                                        color: Colors.orange, width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ),
                                  );
                                },
                                clipBehavior: Clip.none,
                                child: const Center(
                                  child: Text(
                                    'Join',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search for A society'));
  }
}
