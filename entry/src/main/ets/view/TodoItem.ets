import { ToDoData } from '../data/ToDoData'

@Entry
@Component
export struct TodoItem {
  todoData: ToDoData

  build() {
    RelativeContainer() {
      Text(this.todoData.content)
        .margin({
          top:"8vp",
          left:"8vp",
          bottom:"4vp",
        })
        .fontColor(Color.Black)
        .fontSize($r('app.float.font_size_todo_item_title'))
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .id("title")
      Text(this.todoData.createTime)
        .fontColor(Color.Gray)
        .fontSize($r('app.float.font_size_todo_item_create_time'))
        .margin({
          left:"8vp",
          bottom:"8vp"
        })
        .alignRules({
          bottom: { anchor: "__container__", align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start },
        })
        .id("time")
      Image(this.todoData.isFinished ? $r('app.media.icon_completed') : $r('app.media.icon_todo'))
        .width($r('app.float.size_width_todo_item_state'))
        .height($r('app.float.size_height_todo_item_state'))
        .margin({
          right:"8vp"
        })
        .objectFit(ImageFit.Auto)
        .alignRules({
          top:{anchor:'__container__',align:VerticalAlign.Top},
          bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
          right:{anchor:'__container__',align:HorizontalAlign.End}
        })
        .id("state_icon")

    }.width('100%')
    .height('56vp')
  }
}