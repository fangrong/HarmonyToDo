import router from '@ohos.router'

@Entry
@Component
export struct SideBar {
  @State app_version: string = "1.0"
  @State sideItems: {
    icon: Resource,
    title: string | Resource,
    navigation: string
  }[] = []

  build() {
    RelativeContainer() {
      Text($r("app.string.app_name"))
        .margin('20vp')
        .fontColor(Color.Black)
        .fontSize('24fp')
        .id('app_name')
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
      Text(this.app_version)
        .fontColor(Color.Gray)
        .fontSize('18fp')
        .textAlign(TextAlign.Center)
        .id('app_version')
        .alignRules({
          top: { anchor: 'app_name', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })

      List() {
        ForEach(this.sideItems, item => {
          this.sideItemView(item)
        })
      }.id('menu_btns')
      .alignRules({
        top: { anchor: 'app_version', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      })

    }.width('100%')
    .height('100%')
    .backgroundColor(Color.Yellow)

  }

  @Builder
  sideItemView(item: {
    icon: Resource,
    title: string | Resource,
    navigation: string
  }) {
    RelativeContainer() {
      Image(item.icon)
        .objectFit(ImageFit.Auto)
        .width('18vp')
        .height('18vp')
        .id("icon")
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
      Text(item.title)
        .id('title')
        .fontColor(Color.Black)
        .fontSize('20fp')
        .margin({
          left: '8vp'
        })
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: 'icon', align: HorizontalAlign.End }
        })
      Image($r('app.media.icon_right'))
        .id("icon_right")
        .width('14vp')
        .height('14vp')
        .objectFit(ImageFit.Auto)
        .margin({
          right:'20vp'
        })
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
    }.width('100%')
    .height('64vp')
    .onClick(() => {
      router.pushUrl({ url: item.navigation })
    })
  }
}