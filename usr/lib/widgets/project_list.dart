import 'package:flutter/material.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {'name': 'تطبيق الجوال', 'status': 'قيد التنفيذ', 'progress': 0.6},
      {'name': 'لوحة تحكم الويب', 'status': 'مكتمل', 'progress': 1.0},
      {'name': 'تحديث قواعد البيانات', 'status': 'قيد التنفيذ', 'progress': 0.3},
      {'name': 'تكامل الدفع', 'status': 'متوقف', 'progress': 0.1},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        final progress = project['progress'] as double;
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(Icons.code, color: Theme.of(context).colorScheme.primary),
            ),
            title: Text(project['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(project['status'] as String),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  color: progress == 1.0 ? Colors.green : Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
