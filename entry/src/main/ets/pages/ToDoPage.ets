import emitter from '@ohos.events.emitter'
import { Event, EventType } from '../util/Emitter'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import { ToDoData } from '../data/ToDoData'
import ToDoViewModel from '../viewmodel/ToDoViewModel'
import { TodoItem } from '../view/TodoItem'

@Component
@Entry
export struct ToDo{

  @State value:number = 0

  @State todoList:ToDoData[] =[];

  aboutToAppear(){
    ToDoViewModel.getFakeTodoList(todoList=>{
      this.todoList = todoList
    })
  }

  build(){
    List(){
      ForEach(this.todoList,(item:ToDoData)=>{
        ListItem(){
          TodoItem({todoData:item})
        }
      })
    }.listDirection(Axis.Vertical)
  }
}