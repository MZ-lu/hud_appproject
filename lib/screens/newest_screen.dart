import 'package:flutter/material.dart';

class NewestScreen extends StatelessWidget {
  const NewestScreen({super.key});

  // Элементтер тізімі
  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Startup Competition',
      'description':
          'Сені панельдік сессиялар, fireside chat пен keynote-баяндамалар секілді мазмұнды бағдарлама күтіп тұр. Ең үздік спикерлерден шабыт ал!',
      'likes': 1250,
      'image': 'assets/images/item_1.jpg',
      'details':
          "🚀 Central Asia аймағының бір бөлігі болып, жылдың ең жарқын tech-оқиғасына қатысыңыз!",
    },
    {
      'title': 'Global Tech Weekend Tbilisi',
      'description':
          'Dart тілінің жаңа нұсқасы жаңа синтаксис пен қосымша мүмкіндіктермен келді.',
      'likes': 890,
      'image': 'assets/images/item_2.jpg',
      'details':
          "💡 Өнеркәсіп алыптарының алдында питчинг жасау: Roblox, Netflix, Atari, Ubisoft, EBAN, GBAN, Griffin Gaming Partners, JAICA, 500 Startups, Y Combinator, Domino Ventures және басқалары!\n"
          "PR және бренд танымалдығы Халықаралық аудиторияға шығу мүмкіндігі\n"
          "Стартаптар үшін қатысу ақылы, мына форматта: Central Asia аймағындағы толыққанды стенд\n"
          "Startup Alley аймағындағы шағын стендтер (стойка түрінде) Орын саны шектеулі!\n"
          "30 мамырға дейін өтінім беруге үлгеріңіз.\n"
          "Эл.пошта: Info@gtwcentralasia.com",
    },
    {
      'title': 'World Artificial Intelligence Conference',
      'description':
          'Біз Қазақстаннан 4 үздік стартапты таңдап, жасанды интеллект пен озық технология бағытындағы әлемдегі ең беделді алаңдарының бірі – WAIC 2025-те таныстырамыз!',
      'likes': 1500,
      'image': 'assets/images/item_3.jpg',
      'details':
          "• Қатысу және стенд – Astana Hub пен IT Park Uzbekistan есебінен\n"
          "• Тұру шығындары – Шанхай әкімшілігінің субсидиялау мүмкіндігі бар (қосымша мақұлданады)\n"
          "• Халықаралық әуе билеттері — өз есебінен\n\n"
          "📌 Өтінім беру мерзімі: 2025 жылғы 28 мамырға дейін\n"
          "📣 Барлығы 8 стартап іріктеледі!",
    },
    {
      'title': 'Тағылымдама',
      'description': '1 шілдеден бастап 29 тамызға дейін екі қалада өтеді',
      'likes': 750,
      'image': 'assets/images/item_4.jpg',
      'details':
          "— Тағылымдама 1 шілдеден бастап 29 тамызға дейін екі қалада өтеді:\n"
          "▪️ Astana Hub-та 8 орын\n"
          "▪️ Almaty Hub-та 2 орын\n"
          "— Хабтардың ішінде оқу мен даму\n"
          "— IT-воркшоптар, хаб командаларының шеберлік сағаттары, Q&A-сессиялар, тимбилдинг пикник\n"
          "— Әр кезеңде тәлімгерлік пен қолдау\n\n"
          "🧠 Ең бастысы, тағылымдамадан кейін хабтан ресми оффер алу мүмкіндігі бар!",
    },
    {
      'title': 'Tomorrow School',
      'description':
          'Tomorrow School-дың 6-легіне өтінім қабылдау 6 маусымға дейін ұзартылды! Қазақстандағы алғашқы peer-to-peer форматындағы жасанды интеллект мектебіне өтінім беріп үлгер',
      'likes': 980,
      'image': 'assets/images/item_5.jpg',
      'details':
          "Не істеу керек:\n"
          "1️⃣ tomorrow-school.ai платформасына тіркел\n"
          "2️⃣ Логикалық ойлау қабілетін тексеретін екі онлайн-ойынды аяқта\n"
          "3️⃣ 23 мамырда немесе 6 маусымда өтетін Check-in ивентке келіп, даму мен шабыт атмосферасына бөлен\n\n"
          "P.S. Нәтижені жақсарту үшін ойындарды қайта өтуге болады!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Newest',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Events & Opportunities',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: GestureDetector(
                        onTap: () => _showItemDetails(context, item),
                        child: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(255, 75, 88, 1),
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              item['image'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        item['description'],
                        style: const TextStyle(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text('${item['likes']}'),
                        ],
                      ),
                      onTap: () => _showItemDetails(context, item),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showItemDetails(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          item['image'],
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 250,
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.grey,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['description'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Detailed Information:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['details'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.favorite, color: Colors.red),
                            const SizedBox(width: 8),
                            Text(
                              '${item['likes']} likes',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Sharing ${item['title']}'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
