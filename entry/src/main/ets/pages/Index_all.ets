/*
  使用该文件为默认启动页，别忘了去改一下 windowStage.loadContent("pages/Index_all")
*/

// 我们可以直接将 main_pages.json 中的 json 数据导入
import jsonData from '../../resources/base/profile/main_pages.json'
import { HashMap } from '@kit.ArkTS'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index_all {
  pages:string[] = jsonData.src.filter((v)=>{
    if(v.includes('Index')){
      return
    }
    return v
  })

  // 创建HashMap表用于将数据按pages/的所有内容进行分组
  @State pageDays: HashMap<string, string[]> = new HashMap<string, string[]>()
  // 接收分组的所有键作为导航标题
  @State keys: string[] = []
  // 接受分组的所有键对应的值作为内容
  @State values: string[][] = []
  @State currentIndex: number = 0

  // 自定义导航栏
  @Builder
  tabBuilder(item: string, index: number) {
    Text(item)
      .height(60)
      .fontColor(index == this.currentIndex ? "#00f" : "#000")
      .backgroundColor(index == this.currentIndex ? "#d5d5d5" : Color.Transparent)
      .width("100%")
      .borderRadius(15)
      .textAlign(1)
  }

  pageGroup() {
    this.pages.forEach((val: string) => {
      if (this.pageDays.hasKey(val.split("/")[1])) {
        this.pageDays.forEach((value: string[], key: string) => {
          if (key == val.split("/")[1]) {
            if (!value.includes(val)) {
              value.push(val)
            }
          }
        })
      } else {
        this.pageDays.set(val.split("/")[1], [val])
      }
    })

    this.pageDays.forEach((value: string[], key: string) => {
      if (!this.keys.includes(key)) {
        this.keys.push(key)
      }
    })
    this.keys.sort()
    this.keys.forEach((value:string)=>{
      this.values.push(this.pageDays.get(value))
    })
  }

  onPageShow(): void {
    this.pageGroup()
  }

  build() {
    Column() {
      Tabs({ index: $$this.currentIndex }) {
        ForEach(
          this.keys,
          (item: string, index: number) => {
            TabContent() {
              Scroll() {
                Column({ space: 10 }) {
                  ForEach(
                    this.values[index],
                    (value: string, key: number) => {
                      Text(value)
                        .width("96%")
                        .backgroundColor("#fcc")
                        .borderRadius(20)
                        .padding(20)
                        .onClick(() => {
                          router.pushUrl({ url: value })
                        })
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .ellipsisMode(EllipsisMode.START)

                    })
                }
                .alignItems(HorizontalAlign.Center)
                .width("100%")
                .height('auto')
                .padding({ top: 20 })
              }
              .width("100%")
              .height("100%")
            }
            .tabBar(this.tabBuilder(item, index))
            .margin({ right: 5 })
          })
      }
      .animationDuration(0)
      .barBackgroundColor("#f5f5f5")
      .barWidth(80)
      .vertical(true)
      .barMode(BarMode.Scrollable)
      .barHeight('100%')
    }
    .height("100%")
    .width("100%")
  }
}