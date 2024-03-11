import router from '@ohos.router'

@Component
export struct ToolBar {
  private title: string | Resource = ""
  private  toolBarIconSize: Length = 28
  @State enableNaviBtn: boolean = false
  @State toolBtn: {
    icon: Resource,
    title: string | Resource,
    onClick: () => void
  }[] = []

  build() {
    RelativeContainer() {
      if (this.enableNaviBtn) {
        Image($r('app.media.icons_left_96'))
          .objectFit(ImageFit.Auto)
          .width(this.toolBarIconSize)
          .height(this.toolBarIconSize)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            left: { anchor: '__container__', align: HorizontalAlign.Start },
          })
          .margin(12)
          .onClick(() => {
            router.back()
          })
      }

      Text(this.title)
        .id('title')
        .fontSize('26fp')
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
          .width(this.toolBarIconSize)
          .height(this.toolBarIconSize)
          .id('tool_btn')
          .objectFit(ImageFit.Auto)
          .onClick(this.toolBtn[0].onClick)
          .margin(12)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            right: { anchor: '__container__', align: HorizontalAlign.End }
          })
      } else if (this.toolBtn.length > 1) {
        Image($r('app.media.icon_more_96'))
          .width(this.toolBarIconSize)
          .height(this.toolBarIconSize)
          .id('tool_btn')
          .objectFit(ImageFit.Auto)
          .margin(12)
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