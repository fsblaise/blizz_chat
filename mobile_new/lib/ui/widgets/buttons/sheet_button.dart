part of 'buttons.dart';

class SheetButton extends StatelessWidget {
  const SheetButton({
    required this.onTap,
    required this.iconData,
    required this.text,
    super.key,
  });

  final dynamic Function() onTap;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
