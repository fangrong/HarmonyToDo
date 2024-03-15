import relationalStore from '@ohos.data.relationalStore'
import hilog from '@ohos.hilog'

const db_config = {
  name: 'todo.db',
  securityLevel: relationalStore.SecurityLevel.S1
}

const TAG = "ToDoDBHelper"

export class ToDoDBHelper {
  private static todoDb: relationalStore.RdbStore = null
  private static instance: ToDoDBHelper
  private context: Context

  private constructor(context: Context) {
    this.context = context
  }

  public static getInstance(context: Context): ToDoDBHelper {
    if (this.instance == null) {
      this.instance = new ToDoDBHelper(context)
    }
    return this.instance
  }

  public initDb(callback: (err) => {}) {

    relationalStore.getRdbStore(this.context, db_config, (err, store) => {
      if (err) {
        console.error(`Get RdbStore failed, code is ${err.code},message is ${err.message}`);
        hilog.error(0x1000, TAG, `Get RdbStore failed, code is ${err.code},message is ${err.message}`)
        callback(err)
      } else {
        ToDoDBHelper.todoDb = store
        this.createTable(store)
        callback(null)
      }
    })
  }

  private createTable(database: relationalStore.RdbStore) {
    database.executeSql(TodoTable.create_table)
  }
}


/**
 * t_todo 表 包含以下字段：id(主键) content create_time modify_time finished
 */
class Table {
  public static SQL_CREATE_TABLE = 'CREATE TABLE IF NOT EXISTS '
}

class TodoTable extends Table {
  public static TABLE_NAME_TODO = 't_todo'
  public static create_table = TodoTable.SQL_CREATE_TABLE + TodoTable.TABLE_NAME_TODO +
    "(id integer PRIMARY KEY AUTOINCREMENT," +
    "content text," +
    "create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
    "modify_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
    "finished BOOLEAN);"
}