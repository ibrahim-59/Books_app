import 'package:flutter/material.dart';

import '../../../../../core/utils/styles_manager.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: StylesManager.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          SearchListView(),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          // shrinkWrap: true,  bta5od el hight bta3 el children bto3ha

          itemCount: 10,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10), child: Text('')
                // BestSellerListViewItem(
                //   bookModel: BookModel(),
                // ),
                );
          }),
    );
  }
}
