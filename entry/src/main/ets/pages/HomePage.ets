import { Finished } from './FinishedPage'
import { ToDo } from './ToDoPage'
import hilog from '@ohos.hilog'
import emitter from '@ohos.events.emitter'
import { Event, EventType } from '../util/Emitter'
import { Third } from './ThirdPage'
import Ability from '@ohos.app.ability.Ability'
import { SideBar } from '../view/SideBar'
import { ToolBar } from '../view/ToolBar'

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
  @Builder
  tabBuilder(title:string|Resource,targetIndex:number){
    Column(){
      Image($r("app.media.icons_add_normal"))
        .objectFit(ImageFit.Auto)
        .width("48vp")
        .height("48vp")

    }
  }



  build() {
      SideBarContainer(SideBarContainerType.Overlay){
        SideBar({
          app_version:"1.0.0",
          sideItems:[]
        })
        this.mainPage()
      }.controlButton(
        {
          width:24,
          height:24,
          top:12,
          left:12,
          icons:{
            hidden:$r('app.media.icon_more_96'),
            shown:$r('app.media.icon_more_96'),
            switching:$r('app.media.icon_more_96')
          }
        }
      ).sideBarWidth('75%')
    .height('100%')
    .width('100%')
  }

  @Builder
  mainPage(){
    RelativeContainer() {
      ToolBar({title:'待办清单'})
        .id('tool_bar')
        .alignRules({
          top:{anchor:'__container__',align:VerticalAlign.Top},
          left:{anchor:'__container__',align:HorizontalAlign.Start},
          right:{anchor:'__container__',align:HorizontalAlign.End},
        })
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
        TabContent() {
          ToDo()
        }.tabBar("todo")
        TabContent() {
          Finished()
        }.tabBar("finished")
      }.alignRules({
        top:{anchor:'tool_bar',align:VerticalAlign.Bottom},
        left:{anchor:'__container__',align:HorizontalAlign.Start},
        right:{anchor:'__container__',align:HorizontalAlign.End},
        bottom:{anchor:'__container__',align:VerticalAlign.Bottom}
      })
      .id('tabs')
    }
  }



}