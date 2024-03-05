import emitter from '@ohos.events.emitter'
import { Event, EventType } from '../util/Emitter'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import { ToDoData } from '../data/ToDoData'
import ToDoViewModel from '../viewmodel/ToDoViewModel'
import { TodoItem } from '../view/TodoItem'
import thermal from '@ohos.thermal'

const TAG = "ToDoPage"
const LOG_DOMAIN = 0x1000

@Component
@Entry
export struct ToDo {
  @State value: number = 0
  @State todoList: ToDoData[] = [];

  aboutToAppear() {
    ToDoViewModel.getFakeTodoList(todoList => {
      this.todoList = todoList
      hilog.debug(LOG_DOMAIN, TAG, "todo size:" + this.todoList.length)
    })
  }

  build() {
    List() {
      ForEach(this.todoList, (item: ToDoData) => {
        ListItem() {

          TodoItem({ todoData: item })
        }
      })
    }.listDirection(Axis.Vertical)
    .divider({ strokeWidth: 0.5,
      color: Color.Gray,
      startMargin: 0,
      endMargin: 0 })
    .height("100%")
  }
}