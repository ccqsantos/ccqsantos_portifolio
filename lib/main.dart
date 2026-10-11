import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy(); // Removes the '#' from URLs
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cauã dos Santos | Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cauã dos Santos'),
        centerTitle: true,
        actions: [
          // Add your social links here
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () {
              // Open GitHub profile
            },
            tooltip: 'GitHub',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: isMobile ? 60 : 80,
            backgroundColor: Colors.blueGrey.shade100,
            child: Icon(
              Icons.person,
              size: isMobile ? 60 : 80,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Cauã dos Santos',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Multiplatform Software Development Student',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.blueGrey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'FATEC Osasco',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Scroll to projects
                },
                icon: const Icon(Icons.work),
                label: const Text('View My Work'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // Open GitHub
                },
                icon: const Icon(Icons.code),
                label: const Text('GitHub Profile'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'I am a student passionate about software development, '
              'currently studying Multiplatform Software Development at FATEC Osasco. '
              'I have experience with Java, JavaScript, C, and HTML, and I am '
              'constantly expanding my skills to build modern, efficient applications.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Java', 'level': 0.8, 'icon': Icons.code},
      {'name': 'JavaScript', 'level': 0.75, 'icon': Icons.javascript},
      {'name': 'C', 'level': 0.7, 'icon': Icons.terminal},
      {'name': 'HTML/CSS', 'level': 0.8, 'icon': Icons.web},
      {'name': 'Node.js', 'level': 0.6, 'icon': Icons.dns},
      {'name': 'Flutter/Dart', 'level': 0.5, 'icon': Icons.phone_android},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: skills.map((skill) {
              return SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Icon(
                      skill['icon'] as IconData,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      skill['name'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: skill['level'] as double,
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.blueGrey,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'SOLID Principles',
        'description': 'Practicing OOP SOLID principles with Java',
        'tech': 'Java',
        'icon': Icons.architecture,
        'color': Colors.blue,
      },
      {
        'title': 'ReciclaBytes',
        'description':
            'Application showing nearest electronic waste collection points',
        'tech': 'HTML',
        'icon': Icons.recycling,
        'color': Colors.green,
      },
      {
        'title': 'et_pariset_paris',
        'description':
            'REST API with JWT auth, MVC architecture, Sequelize ORM',
        'tech': 'Node.js/Express',
        'icon': Icons.api,
        'color': Colors.orange,
      },
      {
        'title': 'Hangman in Java',
        'description':
            'Hangman game with file manipulation and buffered reading',
        'tech': 'Java',
        'icon': Icons.games,
        'color': Colors.purple,
      },
      {
        'title': 'NewJeans Blog',
        'description': 'Blog project built with HTML',
        'tech': 'HTML',
        'icon': Icons.article,
        'color': Colors.pink,
      },
      {
        'title': 'Guess the Color in C',
        'description': 'Color guessing game implementation',
        'tech': 'C',
        'icon': Icons.palette,
        'color': Colors.red,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth > 900
                    ? 3
                    : (constraints.maxWidth > 600 ? 2 : 1);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: (project['color'] as Color).withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                project['icon'] as IconData,
                                color: project['color'] as Color,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              project['title'] as String,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                project['description'] as String,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Chip(
                              label: Text(project['tech'] as String),
                              backgroundColor: (project['color'] as Color)
                                  .withValues(alpha: 0.1),
                              side: BorderSide.none,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _ContactItem(
                icon: Icons.code,
                label: 'GitHub',
                value: 'github.com/ccqsantos',
              ),
              _ContactItem(
                icon: Icons.school,
                label: 'FATEC Osasco',
                value: 'Multiplatform Software Development',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blueGrey),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}
