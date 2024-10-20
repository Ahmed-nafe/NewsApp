// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:newsapp/Screens/news_detailScreen.dart';
// import 'package:newsapp/cubit/news__cubit.dart';
//
// class NewsScreen extends StatefulWidget {
//   const NewsScreen({super.key});
//
//   @override
//   State<NewsScreen> createState() => _NewsScreenState();
// }
//
// class _NewsScreenState extends State<NewsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<NewsCubit>().fetchData();
//     return;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffb0c3e2ff),
//         centerTitle: true,
//         title: Text(
//           'News',
//           style: GoogleFonts.lato(
//             fontWeight: FontWeight.w400,
//             fontSize: 24,
//           ),
//         ),
//       ),
//       body: BlocBuilder<NewsCubit, NewsState>(
//         builder: (context, state) {
//           if (state is NewsLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is NewsLoaded) {
//             final listOfNews = state.sources;
//             return ListView.builder(
//               itemCount: listOfNews.length,
//               itemBuilder: (context, index) {
//                 final article = listOfNews[index];
//                 return ListTile(
//                   title: article.urlToImage != null &&
//                           article.urlToImage is String &&
//                           article.urlToImage.isNotEmpty
//                       ? Image.network(
//                           article.urlToImage,
//                           fit: BoxFit.cover,
//                           loadingBuilder: (BuildContext context, Widget child,
//                               ImageChunkEvent? loadingProgress) {
//                             if (loadingProgress == null) {
//                               return child;
//                             } else {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                           },
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(Icons.error),
//                         )
//                       : Container(
//                           color: Colors.grey[300],
//                           height: 250,
//                           child:
//                               const Center(child: CircularProgressIndicator()),
//                         ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         article.title ?? "No Title Found",
//                         style: GoogleFonts.lato(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 18,
//                         ),
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.0015),
//                       Text(
//                         article.description ?? "No Description Found",
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: GoogleFonts.lato(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NewsDetailScreen(
//                           imageUrl: article.urlToImage,
//                           content: article.content.toString(),
//                           title: article.title.toString(),
//                           author: article.author.toString(),
//                           publishedAt: article.publishedAt.toString(),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is NewsError) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Text('Error: ${state.error}'),
//               ),
//             );
//           }
//
//           return const Center(
//               child: Text("There is an error Please try again"));
//         },
//       ),
//     );
//   }
// }
