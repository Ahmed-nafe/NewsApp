import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/Model/NewsDataModel.dart';

class NewsItems extends StatelessWidget {
  Articles articles;

  NewsItems({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.33,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                child: articles.urlToImage != null &&
                        articles.urlToImage!.isNotEmpty
                    ? Image.network(
                        articles.urlToImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      )
                    : const SizedBox(
                        height: 200,
                        child: Center(
                          child: Icon(Icons.image, size: 50),
                        ),
                      ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    articles.author ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: const Color(0xff79828B),
                    ),
                  ),
                ),
                Text(
                  articles.publishedAt?.substring(0, 10) ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Color(0xff79828B),
                  ),
                )
              ],
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              articles.title ?? "",
              style: GoogleFonts.exo(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              articles.description ?? "",
              style: GoogleFonts.exo(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
