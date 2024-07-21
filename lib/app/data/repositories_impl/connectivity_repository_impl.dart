import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../data_source/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  ConnectivityRepositoryImpl({
    required Connectivity connectivity,
    required InternetChecker internetChecker,
  })  : _connectivity = connectivity,
        _internetChecker = internetChecker;

  late bool _hasInternet;
  StreamSubscription? _subscription;
  bool _initialized = false;

  final Connectivity _connectivity;
  final InternetChecker _internetChecker;
  final _controller = StreamController<bool>.broadcast();

  @override
  bool get hasInternet {
    assert(_initialized, 'initialized must be called first');
    return _hasInternet;
  }

  @override
  Stream<bool> get onInternetChanged => _controller.stream;

  @override
  Future<void> initialize() async {
    Future<bool> hasInternet(List<ConnectivityResult> result) async {
      if (result.contains(ConnectivityResult.none)) {
        return false;
      }
      return _internetChecker.hasInternet();
    }

    _hasInternet = await hasInternet(
      (await _connectivity.checkConnectivity()),
    );

    _initialized = true;

    _connectivity.onConnectivityChanged.skip(Platform.isIOS ? 1 : 0).listen(
      (event) async {
        _subscription?.cancel();
        _subscription = hasInternet(event).asStream().listen(
          (value) {
            _hasInternet = value;
            if (_controller.hasListener && !_controller.isClosed) {
              _controller.add(_hasInternet);
            }
          },
        );
      },
    );
  }
}
