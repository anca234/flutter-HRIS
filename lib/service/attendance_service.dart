import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';
import '../config/api_config.dart';
import '../service/auth_service.dart';

class AttendanceService {
  static final String baseUrl = ApiConfig.baseUrl;


  static Future<Map<String, dynamic>?> getAttendanceData(int employeeId, String date) async {
    try {
      final token = AuthService.authToken;
      if (token == null) {
        debugPrint('No auth token available');
        return null;
      }

      final response = await http.post(
        Uri.parse('$baseUrl/api_mobile.php?operation=getAttendance'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'employee_id': employeeId,
          'date': date,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          return jsonResponse['data'];
        }
      }
      debugPrint('Failed to fetch attendance: ${response.body}');
      return null;
    } catch (e) {
      debugPrint('Error fetching attendance: $e');
      return null;
    }
  }
  
  // Function to get device info
  static Future<Map<String, String>> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String browser = 'unknown';
    String os = 'unknown';

    try {
      if (kIsWeb) {
        WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
        browser = webInfo.browserName.toString().toLowerCase();
        os = webInfo.platform ?? 'unknown';
      } else if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        browser = 'android-webview';
        os = 'Android ${androidInfo.version.release}';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        browser = 'webkit';
        os = iosInfo.systemName ?? 'iOS';
      }
    } catch (e) {
      debugPrint('Error getting device info: $e');
    }

    return {
      'browser': browser,
      'os': os,
    };
  }

  // Function to record attendance
  static Future<bool> recordAttendance({
    required String address,
    required String addressLink,
  }) async {
    try {
      // Get current user and token
      final currentUser = await AuthService.getCurrentUser();
      final token = AuthService.authToken;

      if (currentUser == null || token == null) {
        debugPrint('User not authenticated');
        return false;
      }

      final deviceInfo = await _getDeviceInfo();
      
      final response = await http.post(
        Uri.parse('$baseUrl/api_mobile.php?operation=recordAttendance'),  // Adjust endpoint as needed
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'employee_id': currentUser.employeeId,
          'address': address,
          'address_link': addressLink,
          'browser': deviceInfo['browser'],
          'os': deviceInfo['os'],
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        debugPrint('Failed to record attendance: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Error recording attendance: $e');
      return false;
    }
  }
}