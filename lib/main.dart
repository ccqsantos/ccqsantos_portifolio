import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  usePathUrlStrategy(); // Removes the '#' from URLs
  runApp(const PortfolioApp());
}

//função de abrir url's
Future<void> launchUrlInBrowser(String urlString) async {
  final Uri url = Uri.parse(urlString);

  //se der erro lançar erro
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $urlString');
  }
}

//classe principal
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cauã dos Santos | Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 60, 0),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHome(),
    );
  }
}

//classe da home
class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cauã dos Santos',
          style: TextStyle(fontFamily: 'LibreCaslonCondensed'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () => launchUrlInBrowser('https://github.com/ccqsantos'),
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
          ClipOval(
            child: Image.asset(
              "../assets/main_pic.png",
              width: isMobile ? 34 : 160,
              height: isMobile ? 34 : 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Cauã dos Santos',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 161, 18, 18),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Cursando Desenvolvimento de Software Multiplataforma',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: const Color.fromARGB(255, 255, 103, 53),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '4º Semestre',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 11),
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
              OutlinedButton.icon(
                onPressed: () =>
                    launchUrlInBrowser('https://github.com/ccqsantos'),
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
            'Sobre Mim',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade800,
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Sou apaixonado pela computação, '
              'atualmente cursando Desenvolvimento de Software Multiplataforma na FATEC Osasco. '
              'Tenho experiência com Java/Spring, JavaScript/Node.js, C, e C#/.NET, e recentemente '
              'tenho estudado LLMs e machine learning.',
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
      {'name': 'C#', 'level': 0.55, 'icon': Icons.terminal},
      {'name': 'HTML/CSS', 'level': 0.9, 'icon': Icons.web},
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
                      color: const Color.fromARGB(255, 161, 18, 18),
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
                      color: const Color.fromARGB(255, 161, 18, 18),
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
        'url': 'https://github.com/ccqsantos/SOLID-Principles',
      },
      {
        'title': 'ReciclaBytes',
        'description':
            'Application showing nearest electronic waste collection points',
        'tech': 'HTML',
        'icon': Icons.recycling,
        'color': Colors.green,
        'url': 'https://github.com/ccqsantos/ReciclaBytes',
      },
      {
        'title': 'et_paris',
        'description':
            'REST API with JWT auth, MVC architecture, Sequelize ORM',
        'tech': 'Node.js/Express',
        'icon': Icons.api,
        'color': Colors.orange,
        'url': 'https://github.com/ccqsantos/et_paris',
      },
      {
        'title': 'Hangman in Java',
        'description':
            'Hangman game with file manipulation and buffered reading',
        'tech': 'Java',
        'icon': Icons.games,
        'color': Colors.purple,
        'url': 'https://github.com/ccqsantos/Hangman-in-Java',
      },
      {
        'title': 'NewJeans Blog',
        'description': 'Blog project built with HTML',
        'tech': 'HTML',
        'icon': Icons.article,
        'color': Colors.pink,
        'url': 'https://github.com/ccqsantos/NewJeansBlogProj',
      },
      {
        'title': 'Guess the Color in C',
        'description': 'Color guessing game implementation',
        'tech': 'C',
        'icon': Icons.palette,
        'color': Colors.red,
        'url': 'https://github.com/ccqsantos/Adivinhe_a_cor_em_C',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 47, 13, 13),
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
                    return InkWell(
                      onTap: () => launchUrlInBrowser(project['url'] as String),
                      borderRadius: BorderRadius.circular(16),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
            'Contato',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 173, 65, 29),
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
                icon: Icons.chat_bubble,
                label: 'X',
                value: 'x.com/ccqsantos',
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
        Icon(icon, size: 41, color: const Color.fromARGB(255, 255, 180, 59)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}
