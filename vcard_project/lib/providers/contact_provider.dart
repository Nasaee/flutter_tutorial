import 'package:flutter/foundation.dart';
import 'package:vcard_project/db/db_helper.dart';
import 'package:vcard_project/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  Future<int> insertContact(ContactModel contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(
      contactModel,
    ); // update the list before notifying the listeners to update the UI
    notifyListeners();
    return rowId;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }

  Future<int> deleteContact(int id) async {
    final rowId = await db.deleteContact(id);
    contactList.removeWhere((element) => element.id == id);
    notifyListeners();
    return rowId;
  }
}
