import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/news_detailScreen.dart';
import 'package:newsapp/news_repository.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<dynamic>> listOfNews;

  @override
  void initState() {
    super.initState();
    listOfNews = NewsRepository().getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffb0c3e2ff),
        centerTitle: true,
        title: Text(
          'News',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: listOfNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data != null) {
            final List<dynamic> list = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: list[index]["urlToImage"] != null &&
                          list[index]["urlToImage"].isNotEmpty
                      ? Image.network(
                        list[index]["urlToImage"],
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      )
                      : Container(
                          color: Colors.grey[300],
                          height: 250,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   list[index]["author"] != null &&
                      //           list[index]["author"].isNotEmpty
                      //       ? list[index]["author"]
                      //       : const Text("No Author Found"),
                      //   style: const TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w400),
                      // ),
                      Text(
                        list[index]["title"] != null &&
                                list[index]["title"].isNotEmpty
                            ? list[index]["title"]
                            : const Text("No Author Found"),
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.0015,
                      ),
                      Text(
                        list[index]["description"] != null &&
                                list[index]["description"].isNotEmpty
                            ? list[index]["description"]
                            : const Text("No Description Founded"),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(
                          imageUrl: list[index]["urlToImage"],
                          content: list[index]["content"],
                          title: list[index]["title"],
                          author: list[index]["author"],
                          publishedAt: list[index]["publishedAt"],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          return const Center(
              child: Text("There is an error Please try again"));
        },
      ),
    );
  }
}
