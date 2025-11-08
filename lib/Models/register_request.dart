
class RegisterRequest {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? address;
  final String? dob;
  final String? companyname;

  RegisterRequest({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.address,
    this.dob,
    this.companyname,
  });

  Map<String,dynamic> tojson(){
    return{
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "phone": phone,
      "address": address,
      "date_of_birth": dob,
      "company_name": companyname,
    };
  }
}