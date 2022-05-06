import 'package:flutter/material.dart';
import 'package:flutter_application_1/datamodel.dart';

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

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return buuildnosuggestions();
    } else {
      final suggestions = listofSocieties.where((element) {
        final namelower = element.name!.toLowerCase();
        final querylower = query.toLowerCase();

        return namelower.startsWith(querylower);
      }).toList();
      return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            ///final suggestion = suggestions[index];
            return ListTile(
              title: Text(suggestions[index].name.toString()),
            );
          });
    }
  }

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
