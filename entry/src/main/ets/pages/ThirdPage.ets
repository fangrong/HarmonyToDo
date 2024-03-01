import hilog from '@ohos.hilog'

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
    Text("Third page")
  }

  callbackfun(data:any){
    hilog.debug(1000,"Third","eventhub:"+data)
  }
}