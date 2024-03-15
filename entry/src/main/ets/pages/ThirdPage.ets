import hilog from '@ohos.hilog'

const TAG = "Third"
@Component
@Entry
export struct Third{
  onPageShow(){
    getContext().eventHub.on("eventHub",this.callbackfun)
  }
  onPageHide(){
    getContext().eventHub.off("eventHub",this.callbackfun)
  }

  build(){
    Column(){
      Text("Third page");
      Button("sync test")
        .onClick(()=>{
          setTimeout(()=>{
            hilog.debug(1000,TAG,"on time out")
          },3000)
        })
    }
  }

  callbackfun(data:any){
    hilog.debug(1000,"Third","eventhub:"+data)
  }
}