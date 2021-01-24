import 'package:flutter/material.dart';



class SearchBar extends StatelessWidget {


  final TextEditingController _searchTextEditingController = TextEditingController();

  final ValueChanged onSearch;
  /// SearchBar(this.onSearch);   /// [namedParameterをpass]
  SearchBar({this.onSearch});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

          child: TextField(
            maxLines: 1,
            controller: _searchTextEditingController,
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              hintText: "go tech",
              border: InputBorder.none,
            ),

            /// [入力値Value(String)をChange反映させるためonSubmitted]
            /// [final ValueChanged<String>? onSubmitted;]
            onSubmitted: onSearch,
          ),

        ),
      ),
    );
  }
}