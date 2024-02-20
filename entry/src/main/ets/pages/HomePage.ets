import { Finished } from './FinishedPage'
import { ToDo } from './ToDoPage'
@Entry
@Component
struct TodoHome {
  private controller: TabsController = new TabsController()

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          ToDo()
        }.tabBar("todo")

        TabContent(){
          Finished()
        }.tabBar("finished")
      }
    }
  }
}