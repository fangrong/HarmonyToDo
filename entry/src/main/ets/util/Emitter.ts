import emitter from '@ohos.events.emitter'


let count : number = 0

export function startEmit() {
  count = 0
  setInterval(emitTimeTick, 1000)
}

function emitTimeTick() {
  console.debug("emit count:",count)
  let timeTickData = {
    data:{"count":count},
  }

  emitter.emit(Event.TimeTickEvent, timeTickData)
  count +=1
}


export enum EventType {
  TimeTick
}

export class Event {
  static TimeTickEvent = { eventId: EventType.TimeTick }
}