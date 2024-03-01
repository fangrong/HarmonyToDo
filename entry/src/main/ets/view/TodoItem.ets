import { ToDoData } from '../data/ToDoData'

@Component
export struct TodoItem {
  todoData: ToDoData

  build() {
    RelativeContainer() {
      Text(this.todoData.content)
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
        .alignRules({
          top: { anchor: "title", align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
      Image(this.todoData.isFinished ? $r('app.media.icon_completed') : $r('app.media.icon_todo'))
        .width($r('app.float.size_width_todo_item_state'))
        .height($r('app.float.size_height_todo_item_state'))
        .alignRules({
          top:{anchor:'__container__',align:VerticalAlign.Top},
          bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
          right:{anchor:'__container__',align:HorizontalAlign.End}
        })
    }
  }
}