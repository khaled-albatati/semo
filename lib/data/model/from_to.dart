class AddressToAddress {
  int? addressToAddressId;
  String? addressToAddressSource;
  String? addressToAddressDestination;
  int? addressToAddressPrice;

  AddressToAddress(
      {this.addressToAddressId,
      this.addressToAddressSource,
      this.addressToAddressDestination,
      this.addressToAddressPrice});

  AddressToAddress.fromJson(Map<String, dynamic> json) {
    addressToAddressId = json['address_to_address_id'];
    addressToAddressSource = json['address_to_address_source'];
    addressToAddressDestination = json['address_to_address_destination'];
    addressToAddressPrice = json['address_to_address_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_to_address_id'] = addressToAddressId;
    data['address_to_address_source'] = addressToAddressSource;
    data['address_to_address_destination'] = addressToAddressDestination;
    data['address_to_address_price'] = addressToAddressPrice;
    return data;
  }
}
