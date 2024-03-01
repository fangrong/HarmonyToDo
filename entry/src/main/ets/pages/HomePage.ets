import { Finished } from './FinishedPage'
import { ToDo } from './ToDoPage'
import hilog from '@ohos.hilog'
import emitter from '@ohos.events.emitter'
import { Event, EventType } from '../util/Emitter'

let count = 10000

let TAG = "TodoHome"

@Entry
@Component
struct TodoHome {
  private controller: TabsController = new TabsController()


  aboutToAppear() {
    hilog.debug(0x1000, TAG, "TodoHome aboutToAppear")
  }

  aboutToDisappear() {
    hilog.debug(0x1000, TAG, "TodoHome aboutToDisappear")

  }

  onPageShow() {
    hilog.debug(0x1000, TAG, "TodoHome onPageShow")
  }

  onPageHide() {
    hilog.debug(0x1000, TAG, "TodoHome onPageHide")
    // emitter.off(EventType.TimeTick)
  }
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          ToDo()
        }.tabBar("todo")

        TabContent() {
          Finished()
        }.tabBar("finished")
      }
    }
  }



}