import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubbleWidget extends StatelessWidget {
  const HerMessageBubbleWidget({
    Key? key,
    required this.message,
    required this.imageUrl,
  }) : super(key: key);

  final Message message;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubbleWidget(
          imageUrl: imageUrl,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubbleWidget extends StatelessWidget {
  final String imageUrl;

  const _ImageBubbleWidget({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
