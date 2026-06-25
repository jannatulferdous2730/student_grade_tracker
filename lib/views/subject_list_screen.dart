import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/grade_tracker_controller.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GradeTrackerController>();
    final theme = Theme.of(context);
    final subjects = controller.subjects;

    if (subjects.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration placeholder using icons
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.menu_book_rounded,
                  size: 64,
                  color: theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'No Subjects Added Yet',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Switch to the "Add Subject" tab to start adding your academic courses and grades.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: subjects.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        final subject = subjects[index];
        final uniqueKey = Key('${subject.name}_${subject.mark}_$index');

        return Dismissible(
          key: uniqueKey,
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            // Delete subject in controller
            controller.deleteSubject(index);

            // Show confirmation SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.delete_outline_rounded,
                      color: theme.colorScheme.onError,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Deleted ${subject.name}',
                        style: TextStyle(
                          color: theme.colorScheme.onError,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: theme.colorScheme.error,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          background: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: theme.colorScheme.error,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Remove',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onError,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.delete_sweep_rounded,
                  color: theme.colorScheme.onError,
                  size: 28,
                ),
              ],
            ),
          ),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  // Book Icon / Avatar
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.assignment_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Subject Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject.name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Score: ',
                              style: theme.textTheme.bodyMedium,
                            ),
                            Text(
                              '${subject.mark}/100',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Grade Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: _getGradeColor(subject.grade, theme),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: _getGradeColor(subject.grade, theme).withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      subject.grade,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: _getGradeTextColor(subject.grade, theme),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to retrieve theme colors for grade tags
  Color _getGradeColor(String grade, ThemeData theme) {
    switch (grade) {
      case 'A':
        return theme.colorScheme.secondary;
      case 'B':
        return theme.colorScheme.primary;
      case 'C':
        return theme.colorScheme.outline;
      default:
        return theme.colorScheme.error;
    }
  }

  // Helper method to retrieve contrasting text colors for grade tags
  Color _getGradeTextColor(String grade, ThemeData theme) {
    switch (grade) {
      case 'A':
        return theme.colorScheme.onSecondary;
      case 'B':
        return theme.colorScheme.onPrimary;
      case 'C':
        return theme.colorScheme.onSurface;
      default:
        return theme.colorScheme.onError;
    }
  }
}
