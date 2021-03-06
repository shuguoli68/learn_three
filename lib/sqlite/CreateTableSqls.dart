
class CreateTableSqls{
  //关系表语句
  static final String createTableSql_relation = '''
    CREATE TABLE IF NOT EXISTS relation (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
    uid BIGINT(20) NOT NULL, 
    fuid BIGINT(20) NOT NULL,
    type INTEGER(3) NOT NULL);
    ''';
  //用户表语句
  static final String createTableSql_user = '''
    CREATE TABLE IF NOT EXISTS user (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, 
    uid BIGINT(20) NOT NULL, 
    phonenumber TEXT(30) NOT NULL, 
    nickName TEXT(100));
    ''';
  Map<String,String> getAllTables(){
    Map<String,String> map = Map<String,String>();
    map['relation'] = createTableSql_relation;
    map['user'] = createTableSql_user;

    return map;
  }

}