import hilog from '@ohos.hilog'

@Component
@Entry
export struct Finished {
  @State count: number = 0
  @State countObj: { param: number } = { param: 0 }

  build() {
    Column() {
      this.showCount({ param: this.count })
      // this.showCount(this.countObj)
      Button("add count")
        .onClick(() => {
          this.count += 1
          this.countObj.param += 1
          hilog.debug(0x1000, "builder", "count:" + this.count)
        })
    }
  }

  @Builder
  showCount(value: { param: number }) {
    Text("" + value.param)
      // .stateStyles({
      //   normal:blueBg(),
      //   clicked:yellowBg()
      // })
  }
}

@Extend(Text)
function blueBg(){
  .backgroundColor(Color.Blue)
}

@Extend(Text)
function yellowBg(){
  .backgroundColor(Color.Yellow)
}



