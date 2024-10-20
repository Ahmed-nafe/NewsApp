import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapp/Screens/source/source_item.dart';
import 'package:newsapp/shared/network/remote/api_manger.dart';

import '../../Model/SourceResponse.dart';
import '../news/news_items.dart';

class SourcesTitle extends StatefulWidget {
  List<Sources> sources;

  SourcesTitle({super.key, required this.sources});

  @override
  State<SourcesTitle> createState() => _SourcesTitleState();
}

int currentIndex = 0;

class _SourcesTitleState extends State<SourcesTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          DefaultTabController(
            initialIndex: currentIndex,
            length: widget.sources.length,
            child: TabBar(
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map(
                    (e) => SourceItem(
                      text: e.name ?? "",
                      isSelected: widget.sources.indexOf(e) == currentIndex,
                    ),
                  )
                  .toList(),
            ),
          ),
          FutureBuilder(
              future: ApiManger.getNewsData(
                widget.sources[currentIndex].id ?? "",
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                  );
                }
                var articles = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return NewsItems(articles: articles[index]);
                      }),
                );
              })
        ],
      ),
    );
  }
}
