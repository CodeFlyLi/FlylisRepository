@Component
export struct LiveStreamContent {
  build() {
    Column() {
      Text("直播内容区域")
      Button("开始直播").margin(10)
    }
  }
}