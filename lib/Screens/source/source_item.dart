import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceItem extends StatefulWidget {
  SourceItem({super.key, required this.text, this.isSelected = false});

  String text;
  bool isSelected;

  @override
  State<SourceItem> createState() => _SourceItemState();
}

class _SourceItemState extends State<SourceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2.5,
        ),
        color: widget.isSelected ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        widget.text,
        style: GoogleFonts.exo(
          color: widget.isSelected ? Colors.white : Colors.green,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
