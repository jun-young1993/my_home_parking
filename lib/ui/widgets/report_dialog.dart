import 'package:flutter/material.dart';

enum ReportReason {
  wrongInfo('잘못된 정보'),
  commercialAd('상업적 광고'),
  adultContent('음란물'),
  violence('폭력성'),
  etc('기타');

  final String label;
  const ReportReason(this.label);

  String get value => name; // enum의 이름을 문자열로 반환
}

class ReportDialog extends StatefulWidget {
  final Function(ReportReason, String?) onReport;

  const ReportDialog({
    super.key,
    required this.onReport,
  });

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  ReportReason? selectedReason;
  final TextEditingController _etcController = TextEditingController();
  bool _isEtcSelected = false;

  @override
  void dispose() {
    _etcController.dispose();
    super.dispose();
  }

  void _handleReasonSelection(ReportReason reason) {
    setState(() {
      selectedReason = reason;
      _isEtcSelected = reason == ReportReason.etc;
    });
  }

  void _handleSubmit() {
    if (selectedReason == null) return;

    if (selectedReason == ReportReason.etc &&
        _etcController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('기타 사유를 입력해주세요.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    widget.onReport(
      selectedReason!,
      selectedReason == ReportReason.etc ? _etcController.text.trim() : null,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '신고사유를 선택해주십시오.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '신고 사유에 맞지 않는 신고일 경우,\n해당 신고는 처리되지 않습니다.\n누적 신고횟수가 3회 이상인 유저는 게시글 작성을 할 수 없게 됩니다.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ...ReportReason.values.map((reason) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () => _handleReasonSelection(reason),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedReason == reason
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              reason.label,
                              style: TextStyle(
                                fontSize: 16,
                                color: selectedReason == reason
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                          if (selectedReason == reason)
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  ),
                )),
            if (_isEtcSelected) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _etcController,
                decoration: InputDecoration(
                  hintText: '기타 사유를 입력해주세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                maxLines: 3,
                textInputAction: TextInputAction.done,
              ),
            ],
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      '취소',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      '신고하기',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
