import call from '@ohos.telephony.call'
import { FakeData } from '../data/FakeData'
import hilog from '@ohos.hilog'

const TAG = "ToDoViewModel"
export class ToDoViewModel{
  constructor() {
    hilog.debug(0x1000,TAG,"new ToDoViewModel")
  }

  static ToDoListChangeEvent = "todo"
  public getTodoList(callback:Function){
    callback([])
  }

  public getFakeTodoList(callback:Function){
    callback(FakeData.toDoDataList)
  }
}

export default new ToDoViewModel()