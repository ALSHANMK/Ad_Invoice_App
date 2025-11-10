import 'package:ad_invoice_mobile/Service/proposalcreationservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Proposalcreationcontroller extends GetxController {
   final Logincontroller logincontroller = Get.find<Logincontroller>();
  final Proposalcreationservice proposalcreationservice = Get.find<Proposalcreationservice>();
  var isloading = false.obs;
  var proposalNumber = ''.obs;
  var invoicenumber = ''.obs;
  var receiptnum=''.obs;
  final now = DateTime.now();
  var issucess = false.obs;
  var issucessinvo = false.obs;
  var issucessreceipt=false.obs;
  var clientData = <String, dynamic>{}.obs;

  Future<void> createproposal(Map<String, dynamic> client, List<Map<String, dynamic>> selecteditems,) async {
    try {
      isloading.value = true;
      clientData.value = client;
      final generatedNumber = _generateProposalNumber;
      proposalNumber.value = generatedNumber;
      final payload = {
        "tenant": logincontroller.tenantid.value,
        "title": "Proposal for ${client['name']}",
        "proposal_number":
            '${now.year}${now.month}${now.day}-${now.millisecondsSinceEpoch}',
        "client_name": client['name'] ?? '',
        "client_email":client['email'] ?? '',
        "client_phone":client['phone'] ?? '',
        "company_name": "Your Company Name",
        "date": DateTime.now().toString().split(' ')[0],
        "due_date": DateTime.now().add(Duration(days: 30)).toString().split(' ')[0],
        "items": _buildItemsPayload(selecteditems),
        "client_id": client['id'].toString(),
        "subtotal": calculateSubtotal(selecteditems),
        "grand_total":calculateGrandTotal(selecteditems),
        "total_gst":calculateGST(selecteditems),
      };

      final response = await proposalcreationservice.createprop(payload);
     
      issucess.value = response['success'] == 'Proposal created successfully'
          ? true
          : false;

      /* Get.snackbar(issucess.value?"Proposal created succesfully":"Failed to create proposal",issucess.value? 
    "You can now print your proposal":"please try again",backgroundColor: issucess.value?
    Colors.green:Colors.red,
    icon: issucess.value?Icon(Icons.check,color: Colors.green,):Icon(Icons.error,color: Colors.red,));*/
    } catch (e) {
      Get.snackbar("Network error", "$e");
      print(e);
    } finally {
      isloading.value = false;
    }
  }

  List<Map<String, dynamic>> _buildItemsPayload(List<Map<String, dynamic>> selectedItems,) {
    return selectedItems.map((item) {

   
     
      return {
        "name": item['name'] ?? '',
        "description": item['description'] ?? '',
        "quantity": item['quantity'] ?? 1,
        "price": item['price'] ?? 0.0,
         "gst_rate": 0.6,
        "type": item['type'] ?? 'product',
      };
    }).toList();
  }

  String get _generateProposalNumber {
    final now = DateTime.now();
    return 'PROP-${now.year}${now.month}${now.day}-${now.millisecondsSinceEpoch}';
  }

  double calculateSubtotal(List<Map<String, dynamic>> items) {
    return items.fold(0.0, (sum, item) {
      final quantity =
          double.tryParse(item['quantity']?.toString() ?? '1') ?? 1.0;
      final price = double.tryParse(item['price']?.toString() ?? '0') ?? 0.0;
      return sum + (quantity * price);
    });
  }

  double calculateGST(List<Map<String, dynamic>> items) {
    final subtotal = calculateSubtotal(items);
    return subtotal * 0.10;
  }

  double calculateGrandTotal(List<Map<String, dynamic>> items) {
    final subtotal = calculateSubtotal(items);
    final gst = calculateGST(items);
    return subtotal + gst;
  }

  // String calculateDueDate(DateTime date) {
  //   final year = date.year;
  // final month = date.month.toString().padLeft(2, '0');
  // final day = date.day.toString().padLeft(2, '0');
  // return '$year-$month-$day';
  // }

  //invoice creation api

  Future<void> createinvoice(Map<String, dynamic> client,List<Map<String, dynamic>> selecteditems,) async {
    try {
      final now = DateTime.now();
      final issueDate =
          "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      // for due date + 30 days later
      final dueDate = now.add(Duration(days: 30));
      final formattedDueDate =
          "${dueDate.year}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}";

      final payload = {
        "tenant": logincontroller.tenantid.value,
        "title": "Proposal for ${client['name']}",
        "proposal_number":
            '${now.year}${now.month}${now.day}-${now.millisecondsSinceEpoch}',
        "client_name": client['name'] ?? '',
        "company_name": "Your Company Name",
        "items": _buildItemsPayload(selecteditems),
        "client_id": client['id'].toString(),
        "subtotal": calculateSubtotal(selecteditems),
        "issue_date": issueDate, // ✅ pure date string
        "due_date": formattedDueDate, // ✅ pure date string
      };

      final response = await proposalcreationservice.createinvo(payload);
      issucessinvo.value=response['success']=="Invoice created successfully"?true:false;

      /* Get.snackbar(issucess.value?"Proposal created succesfully":"Failed to create proposal",issucess.value? 
    "You can now print your proposal":"please try again",backgroundColor: issucess.value?
    Colors.green:Colors.red,
    icon: issucess.value?Icon(Icons.check,color: Colors.green,):Icon(Icons.error,color: Colors.red,));*/
    } catch (e) {
      Get.snackbar("Network error", "$e");
      print("someerror in making invoice $e");
    } finally {
      isloading.value = false;
    }
  }

 //Receipt creation

 Future<void> createrecip(Map <String,dynamic> invoice)async{
  try{
    isloading.value=true;
    final payload={
      "tenant":logincontroller.tenantid.value,
      "amount":invoice['subtotal'],
      "payment_method": "cash",
      "invoice_number": invoice['invoice_number'],
      "client_name": invoice['client_name'],
      "notes": invoice['notes'],
      "date":invoice['issue_date'],
      "total_amount":invoice['grand_total']
    };
    final response=await proposalcreationservice.createreceipt(payload);
    print(response);
    issucessreceipt.value=response['message']=="Receipt created successfully";
    

    Get.snackbar(issucessreceipt.value?"Receipt created successfully":"Couldnt create receipt", 
    issucessreceipt.value?"You can print your receipt":"Try again",backgroundColor: issucessreceipt.value?Colors.green[200]:Colors.red[200]);
    
    
  }
  catch(e)
  {
    print("error in controller $e");
  }
  finally{
    isloading.value=false;
  }
 }

 
}
