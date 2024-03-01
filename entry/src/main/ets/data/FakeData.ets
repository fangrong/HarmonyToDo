import ArrayList from '@ohos.util.ArrayList'
import { ToDoData } from './ToDoData'

export class FakeData{
  static toDoDataList :ToDoData[] =[
    {content:"锻炼身体20分钟",isFinished:false,createTime:"2024.3.1"},
    {content:"leetCode刷一道简单题",isFinished:false,createTime:"2024.2.29"}
  ]

  static finishedDataList:ToDoData[] =[
    {content:"购买生活用品",isFinished:true,createTime:"2024.2.28"},
    {content:"锻炼身体20分钟",isFinished:true,createTime:"2024.2.28"},
  ]
}

