import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

final String tabela = "Dados"; 
final String idColuna = "idColunm";
final String photoColuna= "PhotoColunm";

class DadosHelp{
  static final DadosHelp _instance = DadosHelp.internal();

  factory DadosHelp() => _instance;

  DadosHelp.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "dados.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
        "CREATE TABLE $tabela($idColuna INTEGER PRIMARY KEY, $photoColuna TEXT)"
      );
    });
  }

  Future<Dados> saveContact(Dados contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(tabela, contact.toMap());
    return contact;
  }

  Future<Dados> getContact(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(tabela,
      columns: [idColuna, photoColuna],
      where: "$idColuna = ?",
      whereArgs: [id]);
    if(maps.length > 0){
      return Dados.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database dbContact = await db;
    return await dbContact.delete(tabela, where: "$idColuna = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Dados contact) async {
    Database dbContact = await db;
    return await dbContact.update(tabela,
        contact.toMap(),
        where: "$idColuna = ?",
        whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $tabela");
    List<Dados> listContact = List();
    for(Map m in listMap){
      listContact.add(Dados.fromMap(m));
    }
    return listContact;
  }

  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(await dbContact.rawQuery("SELECT COUNT(*) FROM $tabela"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

}

class Dados{

int id;
String photo;
Dados();
  Dados.fromMap(Map map){
    id = map[idColuna];
    photo = map[photoColuna];
  }

  Map toMap(){
    Map<String,dynamic> map = {
      idColuna: id,
      photoColuna: photo
    };
    if(id != null){
      map[idColuna]= id;
    }
    return map;
  }
}