import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/src/core/utils/theme/theme_instances.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.onDeletePressed,
    required this.onEditPressed,
    required this.id,
    required this.title,
    required this.description,
  });
  final String id, title, description;
  final VoidCallback onDeletePressed;
  final VoidCallback onEditPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          id,
        ),
      ),
      title: Text(
        title,
        style: ThemeInstance(context).bodyLarge,
      ),
      subtitle: Text(
        description,
        style: ThemeInstance(context).bodyMedium,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: onEditPressed,
              icon: Icon(
                Iconsax.edit,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: Icon(
                Iconsax.trash,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
