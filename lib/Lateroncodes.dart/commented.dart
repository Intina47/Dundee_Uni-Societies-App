


///searchdelegate
/*
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
      */