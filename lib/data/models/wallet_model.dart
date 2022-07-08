class WalletModel {
  String? address;
  String? email;
  String? mnemonic;
  String? privateKey;
  String? publicKey;
  String? userId;
  String? username;

  WalletModel(
      {this.address,
      this.email,
      this.mnemonic,
      this.privateKey,
      this.publicKey,
      this.userId,
      this.username});

  factory WalletModel.fromMap(map) {
    return WalletModel(
        address: map['address'],
        email: map['email'],
        mnemonic: map['mnemonic'],
        privateKey: map['private_key'],
        publicKey: map['public_key'],
        userId: map['userId'],
        username: map['username']);
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'mnemonic': mnemonic,
      'private_key': privateKey,
      'public_key': publicKey,
      'userId': userId,
      'username': username
    };
  }
}
