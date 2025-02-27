import 'package:path/path.dart' as P;
import 'package:sqflite/sqflite.dart';
import 'package:vcard_project/models/contact_model.dart';

class DbHelper {
  final String _createTableContact = '''
  CREATE TABLE $tableContact(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    $tblContactColName TEXT NOT NULL,
    $tblContactColMobile TEXT NOT NULL,
    $tblContactColEmail TEXT,
    $tblContactColAddress TEXT,
    $tblContactColCompany TEXT,
    $tblContactColDesignation TEXT,
    $tblContactColWebsite TEXT,
    $tblContactColImage TEXT,
    $tblContactColFavorite INTEGER NOT NULL DEFAULT 0 CHECK ($tblContactColFavorite IN (0, 1))
  )
  ''';

  Future<Database> _open() async {
    final root = await getDatabasesPath(); // Get the path to the database
    final dbPath = P.join(
      root,
      'contact.db',
    ); // Join the path with the database name

    /* 
    version: 1 for the first time database creation change when you migrate the database
    db: is the database object 
  */
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(_createTableContact);
        // db.execute(someOtherTable); // Create other tables
      },
    );
  }

  Future<int> insertContact(ContactModel contact) async {
    final db = await _open();
    return db.insert(tableContact, contact.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(tableContact);
    return List.generate(mapList.length, (index) {
      return ContactModel.fromMap(mapList[index]);
    });
  }
}
