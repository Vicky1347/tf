import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart'; // Import the jiffy package
import '../../domain/entities/pixel.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key? key,
    required this.pixel,
  }) : super(key: key);

  final Pixel pixel;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.zero,
    color: pixel.color.withOpacity(0.3),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 0,
      ),
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      isThreeLine: true,
      visualDensity: VisualDensity.compact,
      dense: true,
      title: Text(
        pixel.uuid,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '${Jiffy.parse(pixel.createdAt.toLocal().toString()).startOf(Unit.second)}\n'
        '(${pixel.offset.dx},${pixel.offset.dy})',
      ),
    ),
  );
}