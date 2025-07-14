import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      '지금까지 당신의 기부는\n이렇게 흘러왔어요',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1B1F),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 26),
                    SizedBox(
                      height: 279,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          DonationCategoryCard(
                            title: '아동/어린이',
                            percentage: '80%',
                            imageUrl: 'https://picsum.photos/108/108?random=1',
                          ),
                          SizedBox(width: 20),
                          DonationCategoryCard(
                            title: '환경',
                            percentage: '12%',
                            imageUrl: 'https://picsum.photos/108/108?random=2',
                          ),
                          SizedBox(width: 20),
                          DonationCategoryCard(
                            title: '동물',
                            percentage: '8%',
                            imageUrl: 'https://picsum.photos/108/108?random=3',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Statistics Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 20.0),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F8F3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '당신의 기부 현황',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF009C38),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatisticItem(
                          label: '총 기부 횟수',
                          value: '24회',
                          icon: Icons.favorite_rounded,
                        ),
                        StatisticItem(
                          label: '총 기부 금액',
                          value: '1,250,000원',
                          icon: Icons.account_balance_wallet_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Recommended Campaigns Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '당신을 위한 추천 캠페인',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1C1B1F),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CampaignCard(
                      title: '아이들에게 따뜻한 겨울을',
                      organization: '굿네이버스',
                      progress: 0.75,
                      amount: '3,750,000원',
                      goal: '5,000,000원',
                      imageUrl: 'https://picsum.photos/400/200?random=4',
                    ),
                    const SizedBox(height: 16),
                    const CampaignCard(
                      title: '멸종위기 동물 보호',
                      organization: 'WWF',
                      progress: 0.45,
                      amount: '2,250,000원',
                      goal: '5,000,000원',
                      imageUrl: 'https://picsum.photos/400/200?random=5',
                    ),
                  ],
                ),
              ),
              
              // Monthly Donation Recommendation Section
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14.25, vertical: 8.55),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5F4E6),
                        borderRadius: BorderRadius.circular(35.62),
                      ),
                      child: const Text(
                        '나에게 딱 맞는 이달의 기부',
                        style: TextStyle(
                          color: Color(0xED1C1B1F),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: const Color(0xED1C1B1F),
                                  child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '아동/어린이',
                                  style: TextStyle(
                                    color: Color(0xFF1C1B1F),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F4343),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    '남은 기부금의 80%',
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  '4,200원',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1C1B1F),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFF009C38), width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '장애아동의 자신감, 운동으로 키워주세요',
                                style: TextStyle(
                                  color: Color(0xFF1C1B1F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD5F4E6),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD9D9D9),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.check_circle,
                                          size: 16,
                                          color: const Color(0xFF009C38),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '매칭률 87%',
                                          style: TextStyle(
                                            color: Color(0xFF009C38),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '사단법인 체인지메이커',
                                    style: TextStyle(
                                      color: Color(0xFF969696),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Environment Section
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: const Color.fromRGBO(28, 27, 31, 0.93),
                                  child: const Text("2", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
                                ),
                                const SizedBox(width: 8),
                                const Text("환경", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F4343),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text("남은 기부금의 12%", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                                ),
                                const SizedBox(width: 8),
                                const Text("600원", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xFF009C38), width: 2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "플라스틱 없는 바다, 함께 만들어요",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD5F4E6),
                                            borderRadius: BorderRadius.circular(32),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFD9D9D9),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.check_circle,
                                                size: 16,
                                                color: const Color(0xFF009C38),
                                              ),
                                              const SizedBox(width: 4),
                                              const Text("매칭률 75%", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF009C38))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Text("환경재단", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF969696))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://picsum.photos/60/60?random=6',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image, color: Colors.grey),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Animals Section
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundColor: const Color.fromRGBO(28, 27, 31, 0.93),
                                  child: const Text("3", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(width: 8),
                                const Text("동물", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F4343),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text("남은 기부금의 8%", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),
                                ),
                                const SizedBox(width: 8),
                                const Text("400원", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xFF009C38), width: 2),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "유기견 보호소 겨울나기 프로젝트",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD5F4E6),
                                            borderRadius: BorderRadius.circular(32),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFD9D9D9),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                              const SizedBox(width: 2),
                                              Icon(
                                                Icons.check_circle,
                                                size: 16,
                                                color: const Color(0xFF009C38),
                                              ),
                                              const SizedBox(width: 4),
                                              const Text("매칭률 69%", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF009C38))),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Text("동물자유연대", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF969696))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://picsum.photos/60/60?random=7',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 60,
                                      height: 60,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.pets, color: Colors.grey),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // CTA and Summary Section
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1B1F),
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: const Center(
                        child: Text(
                          '이대로 기부하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '남은 기부금 5,300원',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF969696),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '지금 사용',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF969696),
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '5,200원',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.account_balance_wallet,
                              size: 20,
                              color: const Color(0xFF009C38),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class DonationCategoryCard extends StatelessWidget {
  final String title;
  final String percentage;
  final String imageUrl;

  const DonationCategoryCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 203,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF009C38),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              width: 108,
              height: 108,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 108,
                  height: 108,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              const Text(
                '내 기부금의',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF969696),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$percentage 전달',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C1B1F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const StatisticItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
          color: const Color(0xFF009C38),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF666666),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1C1B1F),
          ),
        ),
      ],
    );
  }
}

class CampaignCard extends StatelessWidget {
  final String title;
  final String organization;
  final double progress;
  final String amount;
  final String goal;
  final String imageUrl;

  const CampaignCard({
    super.key,
    required this.title,
    required this.organization,
    required this.progress,
    required this.amount,
    required this.goal,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 160,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organization,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF009C38),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C1B1F),
                  ),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color(0xFFE0E0E0),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF009C38)),
                  minHeight: 8,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      amount,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF009C38),
                      ),
                    ),
                    Text(
                      '목표: $goal',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF666666),
                      ),
                    ),
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