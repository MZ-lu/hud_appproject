import 'package:flutter/material.dart';

class PopularityScreen extends StatelessWidget {
  const PopularityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Popularity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const PopularityContent(),
    );
  }
}

class PopularityContent extends StatelessWidget {
  const PopularityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopHackathonsSection(),
          const SizedBox(height: 24),
          const TopPitchSection(),
        ],
      ),
    );
  }
}

class TopHackathonsSection extends StatelessWidget {
  const TopHackathonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('🔥 Top Hackathons'),
        const SizedBox(height: 12),
        SizedBox(
          height: 300, // Суреттерді үлкейту үшін биіктікті арттырдым
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: projectList.length,
            itemBuilder: (context, index) {
              final project = projectList[index];
              return ProjectCard(
                title: project.title,
                imagePath: project.imagePath,
                likes: project.likes,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopPitchSection extends StatelessWidget {
  const TopPitchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('👥 Top Pitch'),
        const SizedBox(height: 12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: participantList.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final participant = participantList[index];
            return ParticipantTile(
              name: participant.name,
              role: participant.role,
              imagePath: participant.imagePath,
              likes: participant.likes,
            );
          },
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class Project {
  final String title;
  final String imagePath;
  final String likes;

  const Project({
    required this.title,
    required this.imagePath,
    required this.likes,
  });
}

class Participant {
  final String name;
  final String role;
  final String imagePath;
  final String likes;

  const Participant({
    required this.name,
    required this.role,
    required this.imagePath,
    required this.likes,
  });
}

const List<Project> projectList = [
  Project(
    title: 'Astana Hub Bootcamp 3.0',
    imagePath: 'assets/hub/hub.photo.jpg',
    likes: '1420',
  ),
  Project(
    title: 'Tomorrow School',
    imagePath: 'assets/hub/photo_2025-05-21_18-24-20.jpg',
    likes: '1285',
  ),
  Project(
    title: 'World Artificial Intelligence Conference',
    imagePath: 'assets/hub/photo_2025-05-26_11-53-40.jpg',
    likes: '1107',
  ),
  Project(
    title: 'Startup Alley',
    imagePath: 'assets/hub/photo_2025-05-28_20-03-47.jpg',
    likes: '1297',
  ),
  Project(
    title: 'Decentrathon 3.0',
    imagePath: 'assets/hub/photo_2025-05-28_20-04-02.jpg',
    likes: '2297',
  ),
];

const List<Participant> participantList = [
  Participant(
    name: 'Steve Wozniak, Ilya Strebulaev, Steve Chen',
    role: 'INMerge Innovation Summit 202',
    imagePath: 'assets/pitch/photo_2025-05-27_09-41-30.jpg',
    likes: '3410',
  ),
  Participant(
    name: 'Kamila and Talgar',
    role: 'Digital Nomad Residency',
    imagePath: 'assets/pitch/photo_2025-05-28_20-02-38.jpg',
    likes: '950',
  ),
  Participant(
    name: 'Rysty and Dimash',
    role: 'Silkway Accelerator 2025',
    imagePath: 'assets/pitch/photo_2025-05-28_20-04-19.jpg',
    likes: '1020',
  ),
  Participant(
    name: 'You',
    role: 'Startup Pitch',
    imagePath: 'assets/pitch/photo_2025-05-28_20-05-24.jpg',
    likes: '1310',
  ),
  Participant(
    name: 'Hugo Camart',
    role: 'VR Design Masterclass',
    imagePath: 'assets/pitch/photo_2025-05-28_20-14-44.jpg',
    likes: '910',
  ),
];

class ProjectCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String likes;

  const ProjectCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Loading image from: $imagePath');
    return Container(
      width: 200, // Карточканы кеңейттім
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              height: 150, // Суретті үлкейттім
              width: double.infinity,
              fit: BoxFit.cover,
              cacheHeight: 300, // Анықтықты арттыру үшін
              cacheWidth: 400, // Анықтықты арттыру үшін
              errorBuilder: (context, error, stackTrace) {
                debugPrint('Error loading image: $error');
                return Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: Icon(Icons.broken_image, color: Colors.grey[400]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text('$likes likes'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParticipantTile extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final String likes;

  const ParticipantTile({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Loading participant image from: $imagePath');
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        radius: 36, // Аватарды үлкейттім
        backgroundImage: imagePath.isNotEmpty ? AssetImage(imagePath) : null,
        onBackgroundImageError: (exception, stackTrace) {
          debugPrint('Image load failed: $exception');
        },
        child: imagePath.isEmpty ? Text(name.isNotEmpty ? name[0] : '?') : null,
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(role, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.thumb_up, color: Colors.blue, size: 20),
          const SizedBox(width: 4),
          Text(likes),
        ],
      ),
    );
  }
}
