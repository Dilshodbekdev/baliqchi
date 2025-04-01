import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DiseaseDetailsContainer extends StatelessWidget {
  final Color color;
  final String title;
  final String content;

  const DiseaseDetailsContainer({
    super.key,
    required this.color,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 16,left: 16,bottom: 0,top: 16),
      decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: color),
          ),
          Html(
            data: content,
            shrinkWrap: false,
          ),
        ],
      ),
    );
  }
}
