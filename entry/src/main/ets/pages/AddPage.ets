import { ToolBar } from '../view/ToolBar'
import hilog from '@ohos.hilog'
import router from '@ohos.router'

let TAG = "AddPage"

@Component
@Entry
export struct AddPage {
  onPageShow(){
    hilog.debug(1000,TAG,"AddPage show")
  }

  onPageHide(){
    hilog.debug(1000,TAG,"AddPage hide")
  }

  build() {
    RelativeContainer() {
      ToolBar({
        title: $r('app.string.add_todo'),
        naviBtnClickEvent: () => {
          hilog.debug(0x1000, TAG, "back button clicked")
          router.back()
        },
        toolBtn: [{ title: $r('app.string.save'),
          icon: $r('app.media.icon_save_96'),
          onClick: () => {
            hilog.debug(0x1000, TAG, "save button clicked")
          }
        }],
        enableNaviBtn: true
      })
        .id('tool_bar')
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End },
        })
      this.mainContent()
    }.width('100%')
    .height('100%')
  }

  @Builder
  mainContent() {
    RelativeContainer() {
      TextInput({
        placeholder: $r('app.string.add_todo_hint')
      })
        .textAlign(TextAlign.Start)
        .placeholderColor(Color.Gray)
        .width('100%')
        .height('100%')
    }.id('content')
    .alignRules({
      top: { anchor: 'tool_bar', align: VerticalAlign.Bottom },
      left: { anchor: '__container__', align: HorizontalAlign.Start },
      right: { anchor: '__container__', align: HorizontalAlign.End },
      bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
    })

    Button("sync test")
      .onClick(() => {
        setTimeout(() => {
          hilog.debug(1000, TAG, "on time out")
        }, 3000)
      })
      .id('test_btn')
      .alignRules({
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End },
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
      })
  }
}