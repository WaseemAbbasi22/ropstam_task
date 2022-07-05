class User {
  int? id;
  String? username;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? mobile;
  bool? mobileVerifiedAt;
  Null? apiToken;
  String? image;
  String? address;
  String? country;
  String? state;
  String? role;
  int? verified;
  String? lang;
  String? ltd;
  String? deviceToken;
  int? gender;
  Null? type;
  Null? customerId;
  Null? provider;
  Null? addedBy;
  String? rating;
  int? ratingCount;
  Null? rememberToken;

  User(
      {this.id,
        this.username,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.mobile,
        this.mobileVerifiedAt,
        this.apiToken,
        this.image,
        this.address,
        this.country,
        this.state,
        this.role,
        this.verified,
        this.lang,
        this.ltd,
        this.deviceToken,
        this.gender,
        this.type,
        this.customerId,
        this.provider,
        this.addedBy,
        this.rating,
        this.ratingCount,
        this.rememberToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    mobile = json['mobile'];
    mobileVerifiedAt = json['mobile_verified_at'];
    apiToken = json['api_token'];
    image = json['image'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    role = json['role'];
    verified = json['verified'];
    lang = json['lang'];
    ltd = json['ltd'];
    deviceToken = json['device_token'];
    gender = json['gender'];
    type = json['type'];
    customerId = json['customer_id'];
    provider = json['provider'];
    addedBy = json['added_by'];
    rating = json['rating'];
    ratingCount = json['rating count'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile'] = this.mobile;
    data['mobile_verified_at'] = this.mobileVerifiedAt;
    data['api_token'] = this.apiToken;
    data['image'] = this.image;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['role'] = this.role;
    data['verified'] = this.verified;
    data['lang'] = this.lang;
    data['ltd'] = this.ltd;
    data['device_token'] = this.deviceToken;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['customer_id'] = this.customerId;
    data['provider'] = this.provider;
    data['added_by'] = this.addedBy;
    data['rating'] = this.rating;
    data['rating count'] = this.ratingCount;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}
