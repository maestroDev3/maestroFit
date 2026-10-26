import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

/// Basisinformationen der App.
///
/// Dient zugleich als Nachweis, dass die Codegenerierung
/// (freezed + riverpod_generator) funktioniert – siehe Task #41.
@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    required String name,
    required String version,
  }) = _AppInfo;
}

/// Stellt die [AppInfo] der laufenden App bereit.
@riverpod
AppInfo appInfo(Ref ref) {
  return const AppInfo(name: 'maestroFit', version: '0.1.0');
}
