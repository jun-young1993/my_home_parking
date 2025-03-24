import 'package:flutter/material.dart';

class ParkingNoticeScreen extends StatefulWidget {
  const ParkingNoticeScreen({super.key});

  @override
  State<ParkingNoticeScreen> createState() => _ParkingNoticeScreenState();
}

class _ParkingNoticeScreenState extends State<ParkingNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('주차장 게시판'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // 임시 데이터 개수
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                // TODO: 게시글 상세보기
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 공지사항 뱃지와 날짜
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.red.shade50
                                : Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            index == 0 ? '공지' : '일반',
                            style: TextStyle(
                              color: index == 0 ? Colors.red : Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '2024.03.15',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // 제목
                    Text(
                      index == 0 ? '[공지] 주차장 이용 수칙 안내' : '주차장 관련 게시글 $index',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // 내용 미리보기
                    Text(
                      '주차장 이용과 관련된 중요한 내용입니다. 자세한 내용은 게시글을 확인해주세요.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // 작성자 정보와 조회수
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '관리사무소',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${index * 10 + 42}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      // 글쓰기 버튼
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: 글쓰기 화면으로 이동
        },
        icon: const Icon(Icons.edit),
        label: const Text('글쓰기'),
      ),
    );
  }
}
