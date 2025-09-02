import { SwiperFu } from '../../interface/CustomInterface'

@Entry
@Component
export struct Recommend {
  @State swiperMains: Array<SwiperFu> =
    [{ id: "0", swiperMain: "app.media.sw16_9_1" }, { id: "1", swiperMain: "app.media.sw16_9_2" },
      { id: "2", swiperMain: "app.media.sw16_9_3" }, { id: "3", swiperMain: "app.media.sw16_9_4" }]
  private controller: VideoController = new VideoController()
  private previewUris: Resource = $r('app.media.lina')
  private innerResource: Resource = $rawfile('videoTest.mp4')

  build() {
    Column() {
      Swiper() {
        ForEach(this.swiperMains, (item: SwiperFu) => {
          Image($r(`${item.swiperMain}`))
        }, (item: SwiperFu) => item.id)
      }
      .loop(true)
      .autoPlay(true)
      .interval(2000)
      .indicator(
        Indicator.dot()
          .right(0)
          .itemWidth(8)
          .itemHeight(8)
          .selectedItemWidth(8)
          .selectedItemHeight(8)
          .color(Color.Gray)
          .selectedColor(Color.White)
      )
      .width("98%")
      .border({ radius: 5 })

      Grid() {
        GridItem() {
          Video({
            src: this.innerResource,
            controller: this.controller
          })
            .muted(false)// 设置是否静音
            .controls(true)// 设置是否显示默认控制条
            .autoPlay(true)// 设置是否自动播放
            .loop(true)// 设置是否循环播放
            .objectFit(ImageFit.Contain) // 设置视频适配模式
        }

        
        GridItem() {
          Video({
            src: this.innerResource,
            controller: this.controller
          })
            .muted(false)// 设置是否静音
            .controls(true)// 设置是否显示默认控制条
            .autoPlay(true)// 设置是否自动播放
            .loop(true)// 设置是否循环播放
            .objectFit(ImageFit.Contain) // 设置视频适配模式
        }
      }.rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
    }.width("100%").height("100%")
  }
}