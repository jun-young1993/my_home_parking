# 광고 매니저 패키지 사용 가이드

이 패키지는 구글 애드몹 광고를 쉽게 관리하고 사용할 수 있도록 도와주는 유틸리티입니다.

## 초기화

앱 시작 시 광고 매니저를 초기화해야 합니다:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdInitializer.initialize();
  // ... 다른 초기화 코드
  runApp(MyApp());
}
```

## 앱 오픈 광고 사용

앱 오픈 광고는 앱이 백그라운드에서 포그라운드로 전환될 때 표시됩니다:

```dart
class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAppOpenAd();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _showAppOpenAd();
    }
  }

  Future<void> _loadAppOpenAd() async {
    await ref.read(appOpenAdProvider.notifier).loadAppOpenAd();
  }

  void _showAppOpenAd() {
    ref.read(appOpenAdProvider.notifier).showAppOpenAd();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ... 앱 설정
    );
  }
}
```

## 배너 광고 사용

### 위젯으로 사용

```dart
AdBannerWidget(
  size: AdSize.banner,  // 광고 크기 선택
  isTest: kDebugMode,   // 테스트 모드 설정
  margin: EdgeInsets.all(16),  // 마진 설정
  alignment: Alignment.center,  // 정렬 설정
)
```

### Riverpod 사용

```dart
// 상태 구독
final bannerAdState = ref.watch(bannerAdProvider);

// 광고 로드
await ref.read(bannerAdProvider.notifier).loadBannerAd(AdSize.banner);
```

## 전면 광고 사용

```dart
// 상태 구독
final interstitialAdState = ref.watch(interstitialAdProvider);

// 광고 로드
await ref.read(interstitialAdProvider.notifier).loadInterstitialAd();

// 광고 표시
ref.read(interstitialAdProvider.notifier).showInterstitialAd();
```

## 보상형 광고 사용

```dart
// 상태 구독
final rewardedAdState = ref.watch(rewardedAdProvider);

// 광고 로드
await ref.read(rewardedAdProvider.notifier).loadRewardedAd();

// 광고 표시
ref.read(rewardedAdProvider.notifier).showRewardedAd();
```

## 주요 기능

1. **광고 타입 관리**
   - 앱 오픈 광고
   - 배너 광고
   - 전면 광고
   - 보상형 광고
   - 네이티브 광고

2. **상태 관리**
   - Riverpod을 사용한 광고 상태 관리
   - 로딩 상태 추적
   - 에러 처리

3. **재사용 가능한 위젯**
   - `AdBannerWidget`을 통한 배너 광고 표시
   - 커스터마이징 가능한 마진과 정렬

4. **초기화 및 설정**
   - 테스트 모드 지원
   - 테스트 기기 설정
   - 광고 미리 로드

5. **에러 처리**
   - 광고 로드 실패 처리
   - 디버그 로깅

## 주의사항

1. 실제 광고 ID 설정
   - `AdUnitIds` 클래스에 실제 광고 ID를 설정해야 합니다.
   - 테스트 광고 ID는 개발 중에만 사용하세요.

2. 테스트 모드
   - 개발 중에는 `isTest: true`로 설정
   - 실제 배포 시에는 `isTest: false`로 변경

3. 광고 로드 실패 처리
   - 광고 로드 실패 시 적절한 에러 처리를 구현하세요.
   - 사용자에게 적절한 피드백을 제공하세요.

4. 메모리 관리
   - 광고를 더 이상 사용하지 않을 때는 `dispose()`를 호출하여 메모리를 해제하세요.
   - 위젯이 dispose될 때 광고도 함께 dispose되도록 구현하세요.

5. 앱 오픈 광고 주의사항
   - 앱 오픈 광고는 앱이 백그라운드에서 포그라운드로 전환될 때만 표시됩니다.
   - 앱을 처음 실행할 때는 표시되지 않습니다.
   - 앱 오픈 광고는 30초 간격으로만 표시됩니다.

## 예제 코드

### 앱 오픈 광고 예제

```dart
class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadAppOpenAd();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _showAppOpenAd();
    }
  }

  Future<void> _loadAppOpenAd() async {
    await ref.read(appOpenAdProvider.notifier).loadAppOpenAd();
  }

  void _showAppOpenAd() {
    ref.read(appOpenAdProvider.notifier).showAppOpenAd();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ... 앱 설정
    );
  }
}
```

### 배너 광고 예제

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('광고 예제')),
      body: Column(
        children: [
          Expanded(
            child: Center(child: Text('메인 콘텐츠')),
          ),
          AdBannerWidget(
            size: AdSize.banner,
            isTest: kDebugMode,
            margin: EdgeInsets.all(16),
          ),
        ],
      ),
    );
  }
}
```

### 전면 광고 예제

```dart
class MyButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(interstitialAdProvider.notifier).loadInterstitialAd();
        ref.read(interstitialAdProvider.notifier).showInterstitialAd();
      },
      child: Text('전면 광고 표시'),
    );
  }
}
```

### 보상형 광고 예제

```dart
class RewardButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(rewardedAdProvider.notifier).loadRewardedAd();
        ref.read(rewardedAdProvider.notifier).showRewardedAd();
      },
      child: Text('보상형 광고 표시'),
    );
  }
}
```
