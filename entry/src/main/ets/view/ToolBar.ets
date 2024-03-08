import router from '@ohos.router'

@Component
export struct ToolBar {
  @State title: string = ""
  @State enableNaviBtn: boolean = false
  @State toolBtn: {
    icon: Resource,
    title: string | Resource,
    onClick: () => {}
  }[] = []

  build() {
    RelativeContainer() {
      if (this.enableNaviBtn) {
        Image($r('app.media.icons_left_96'))
          .objectFit(ImageFit.Auto)
          .width('48vp')
          .height('48vp')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            left: { anchor: '__container__', align: HorizontalAlign.Start },
          })
          .margin({
            right: '24vp'
          })
          .onClick(() => {
            router.back()
          })
      }

      Text(this.title)
        .id('title')
        .fontSize('32fp')
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })


      if (this.toolBtn.length == 1) {
        Image(this.toolBtn[0].icon)
          .width('48vp')
          .height('48vp')
          .id('tool_btn')
          .objectFit(ImageFit.Auto)
          .onClick(this.toolBtn[0].onClick)
          .margin({
            left: '24vp'
          })
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
      } else if (this.toolBtn.length > 1) {
        Image($r('app.media.icon_more_96'))
          .width('48vp')
          .height('48vp')
          .id('tool_btn')
          .objectFit(ImageFit.Auto)
          .margin({
            left: '24vp'
          })
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
          .bindMenu(this.toolMenu())
      }
    }.toolbarStyle()
  }

  @Builder
  toolMenu() {
    Menu() {
      ForEach(this.toolBtn, tool => {
        MenuItem({
          content: tool.title,
          startIcon: tool.icon,
        })
          .onClick(tool.onClick)
      })
    }
  }
}


@Styles
function toolbarStyle() {
  .backgroundColor($r('app.color.tool_bar_background'))
  .width('100%')
  .height('48vp')
}