import 'dart:async';

import 'package:auhtify/core/services/downloads/download_options.dart';

import 'download_operation.dart';

class DownloadManager {
  ///
  final DownloadOptions options;

  // Private constructor
  DownloadManager._(this.options);

  // Singleton instance
  static DownloadManager? _instance;

  // Factory constructor
  factory DownloadManager({required DownloadOptions options}) {
    _instance ??= DownloadManager._(options);
    return _instance!;
  }

  // List to hold all download operations
  final List<DownloadOperation> operations = [];

  // Initialize method called when the app starts
  Future<void> initialize() async {
    // Initialization logic
  }

  // Dispose method to clean up resources
  Future<void> dispose() async {
    // Clean-up logic
  }

  // Method to add a download operation
  Future<void> addOperation({required DownloadOperation operation}) async {
    ///
    operations.add(operation);

    ///
    if (operations.length < options.maxDownloadsPerSecond) {
      await operations.last.forward(
        controller: operations.last.request.controller,
      );
    }
  }

  // Method to get all operations
  Future<List<DownloadOperation>> getOperations() async {
    return operations;
  }

  // Method to pause a download operation
  Future<void> pauseOperation({required int id}) async {
    await operations[id].pause();
  }

  // Method to cancel a download operation
  Future<void> cancelOperation({required int id}) async {
    await operations[id].cancel();
    operations.removeAt(id);
  }
}
