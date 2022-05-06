/*
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/dataread.dart';
import 'package:flutter_application_1/datamodel.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class Search extends SearchDelegate {
  List<String> data = [
    "MOrrocco",
    "Cosovo",
    "Rangau",
    "Muthurwa",
    "Kibico",
    "Kaboke",
    "Ngara",
    "Railways",
    "Kibich",
    "Kibiko",
    "olesereni",
    "Matter",
    "Twala",
    "Rongai",
    "Forty6",
    "Porty"
  ];
  List<String> recentSearch = [
    "MOrrocco",
    "Cosovo",
    "Rangau",
    "Muthurwa",
    "Kibico",
    "Kaboke"
  ];
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

//DETAIL PAGE
  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: const Text(
                  'something went wrong',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              );
            } else if (data.hasData) {
              var items = data.data as List<Societiesdatamodel>;
              return ListView.builder(itemBuilder: ((context, index) {
                return Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Ink.image(
                                image: NetworkImage(
                              items[index].imageurl.toString(),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              items[index].name.toString(),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
              }));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildResultsSuccess(Societiesdatamodel society) => ListView(
        padding: const EdgeInsets.all(64),
        children: [
          Text(
            society.name.toString(),
            style: const TextStyle(
              fontSize: 32,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );

  @override
  Widget buildSuggestions(BuildContext context) => Container(
        color: Colors.white,
        child: FutureBuilder<List<Societiesdatamodel>>(
          future: SocietiesApi.readJsonData(query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                //  if (snapshot.hasData) {
                return buuildsuggestionssuccess((snapshot.data!.toList()));
              //    return buuildnosuggestions();
              // }
            }
          },
        ),
      );
  Widget buuildsuggestionssuccess(List<Societiesdatamodel> suggestions) =>
      ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
/*
            return ListTile(
              onTap: () {
                query = suggestion.toString();
              },
              leading: Image.network(suggestion.imageurl.toString()),
              title: Text(suggestion.name.toString()),
            );
            */

            final querytext = suggestion.substring(0, query.length);
            final remainingtext = suggestion.substring(0, query.length);
            return ListTile(
              onTap: () {
                query = suggestion.toString();
                showResults(context);
              },
              //title: Text(suggestion),
              title: RichText(
                  text: TextSpan(
                      text: querytext,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                    TextSpan(
                        text: remainingtext,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ))
                  ])),
            );
          });

/*
  @override
  Widget buildSuggestions(BuildContext context) => FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          // if (query.isEmpty) return buuildnosuggestions();
          switch (data.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              /*
              if (data.hasData) {
                return buuildnosuggestions();
              } 
              */

              if (data.hasData) {
                var items = data.data as List<Societiesdatamodel>;
                return ListView.builder(itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Ink.image(
                                  image: NetworkImage(
                                items[index].imageurl.toString(),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                items[index].name.toString(),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  );
                }));
              } else {
                return buuildnosuggestions();
              }
          }
        },
      );

      //Widget buuildnosuggestions() =>


*/

  Widget buuildnosuggestions() => Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: const Center(
        child: Text(
          'something went wrong',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ));
}
*/