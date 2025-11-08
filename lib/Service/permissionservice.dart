import 'package:ad_invoice_mobile/controllers/apicontrollers/rolecontroller.dart';
import 'package:get/get.dart';

class PermissionService extends GetxService {
  final Rolecontroller rolecontroller = Get.find();
  
  // Check if user has specific permission
  bool can(String permissionCode) {
    final userPermissions = rolecontroller.currentUserPermissions;
    return userPermissions.any((permission) => permission['code'] == permissionCode);
  }
  
  // Check if user has any of the given permissions
  bool canAny(List<String> permissionCodes) {
    final userPermissions = rolecontroller.currentUserPermissions;
    return permissionCodes.any((code) => 
        userPermissions.any((permission) => permission['code'] == code));
  }
  
  // Check if user has all of the given permissions
  bool canAll(List<String> permissionCodes) {
    final userPermissions = rolecontroller.currentUserPermissions;
    return permissionCodes.every((code) => 
        userPermissions.any((permission) => permission['code'] == code));
  }
  
  // Get permission description by code
  String? getDescription(String permissionCode) {
    final permission = rolecontroller.permission.firstWhere(
      (p) => p['code'] == permissionCode,
      orElse: () => {},
    );
    return permission['description'];
  }
}