class AddressModel {
  String _name;
  String _address;
  String _homePhone;
  String _mobilePhone;
  String _email;
  String _notes;

  AddressModel(this._name, this._address, this._homePhone, this._mobilePhone,
      this._email, this._notes);

  String get name => _name;
  String get homePhone => _homePhone;
  String get mobilePhone => _mobilePhone;
  String get email => _email;
  String get address => _address;
  String get notes => _notes;

  set name(String newName) {
    if (newName.length <= 80) {
      this._name = newName;
    }
  }

  set homePhone(String newHomePhone) {
    if (newHomePhone.length <= 30) {
      this._homePhone = newHomePhone;
    }
  }

  set mobilePhone(String newMobilePhone) {
    if (newMobilePhone.length <= 30) {
      this._mobilePhone = newMobilePhone;
    }
  }

  set email(String newEmail) {
    if (newEmail.length <= 60) {
      this._email = newEmail;
    }
  }

  set address(String newAddress) {
    if (newAddress.length <= 255) {
      this._address = newAddress;
    }
  }

  set notes(String newNotes) {
    if (newNotes.length <= 255) {
      this._notes = newNotes;
    }
  }
}
