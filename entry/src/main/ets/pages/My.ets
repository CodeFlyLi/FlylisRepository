import { MenuItemIcon } from '../interface/CustomInterface'
import { MyCourses } from "../components/service/MyCourses"

@Entry
@Component
export struct My {
  //顶部icon数组
  @State imgs: Array<string> = ["app.media.tp", "app.media.sys", "app.media.pf", "app.media.yj"]
  //快捷功能数组
  @State shortcutArray: Array<MenuItemIcon> =
    [{
      name: "离线缓存",
      icon: "app.media.lxhc",
      pathUrls: MyCourses,
      NetworkRequestUrls: "/lixianhuancun"
    },
      { name: "历史记录", icon: "app.media.ls", pathUrls: MyCourses },
      { name: "我的收藏", icon: "app.media.sc", pathUrls: MyCourses },
      { name: "稍后再看", icon: "app.media.shzk", pathUrls: MyCourses }]
  //创作中心功能数组
  @State creationArray: Array<MenuItemIcon> =
    [{ name: "创作中心", icon: "app.media.czzx", pathUrls: MyCourses },
      { name: "稿件管理", icon: "app.media.gjgl", pathUrls: MyCourses },
      { name: "数据中心", icon: "app.media.sjzx", pathUrls: MyCourses },
      { name: "有奖活动", icon: "app.media.yjhd", pathUrls: MyCourses }]
  //推荐服务功能布局数组
  @State recommendArray: Array<MenuItemIcon> =
    [{ name: "我的课程", icon: "app.media.wdkc", pathUrls: MyCourses },
      { name: "免流量服务", icon: "app.media.mll", pathUrls: MyCourses },
      { name: "个性装扮", icon: "app.media.gxbz", pathUrls: MyCourses },
      { name: "我的钱包", icon: "app.media.wdqb", pathUrls: MyCourses },
      { name: "会员购中心", icon: "app.media.hygzx", pathUrls: MyCourses },
      { name: "我的直播", icon: "app.media.wdzb", pathUrls: MyCourses },
      { name: "漫画", icon: "app.media.mh", pathUrls: MyCourses },
      { name: "必火推广", icon: "app.media.hot", pathUrls: MyCourses },
      { name: "社区中心", icon: "app.media.sqzx", pathUrls: MyCourses },
      { name: "飞飞公益", icon: "app.media.gy", pathUrls: MyCourses },
      { name: "工房", icon: "app.media.gf", pathUrls: MyCourses },
      { name: "能量加油站", icon: "app.media.jy", pathUrls: MyCourses },
      { name: "嘉年华", icon: "app.media.hyjnh", pathUrls: MyCourses }]
  // 声明Scroller实例
  private scroller: Scroller = new Scroller()
  //list功能数组
  @State iconLists: Array<MenuItemIcon> =
    [{ name: "联系客服", icon: "app.media.lxkf" }, { name: "听视频", icon: "app.media.tsp" },
      { name: "未成年人守护", icon: "app.media.wcnsh" }, { name: "设置", icon: "app.media.sz" }]
  @State currentIndex: number = 2
  // quickPageStark: NavPathStack = new NavPathStack()
  pageStark: NavPathStack = new NavPathStack()

  // listPageStark: NavPathStack = new NavPathStack()

  @Builder
  tabBuilder(title: string, targetIndex: number) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
  }

  build() {
    Navigation(this.pageStark) {
      Column() {
        //顶部icon
        Row({ space: 30 }) {
          ForEach(this.imgs, (img: string) => {
            Image($r(`${img}`)).width(20).height(20).objectFit(ImageFit.Auto).onClick(() => {
              // this.getUIContext().getRouter().back();
            })
          }, (img: string) => img)
        }.justifyContent(FlexAlign.End).width('90%')

        //头像个人简要信息
        Row() {
          Column() {
            //头像
            Image($r(`app.media.ktfly`))
              .width(80)
              .height(80)
              .objectFit(ImageFit.Auto).padding(3)
          }.width("30%")

          Column() {
            Row() {
              Text("Fly--li").fontSize(12)
              //修改标签图标
              Image($r(`app.media.bj`)).width(20).height(20)
              //等级
              Image($r(`app.media.lv5`)).width(30).height(30)
            }

            Row() {
              //会员标识
              Text("正式会员")
                .fontSize(8)
                .border({
                  color: '#FF0000',
                  style: BorderStyle.Solid,
                  width: 1,
                  radius: "10%"
                }).fontColor("#FF0000").padding(2)
            }

            Row({ space: 5 }) {
              Text("B币：800").fontSize(12).fontColor("#8a8a8a").padding(2)
              Text("硬币：6578").fontSize(12).fontColor("#8a8a8a").padding(2)
            }
          }
          // Column 默认的子组件对齐方式是水平居中改为HorizontalAlign.Star
          .alignItems(HorizontalAlign.Start).width("50%")

          Column() {
            Text("空间 >")
          }.width("20%").alignItems(HorizontalAlign.End)
        }.width("90%")

        // 动态关注粉丝快捷入口
        Row() {
          Column() {
            Text("9")
            Text("动态")
          }

          Text("|")

          Column() {
            Text("244")
            Text("关注")
          }

          Text("|").fontColor("#")
          Column() {
            Text("9")
            Text("粉丝")
          }
        }.justifyContent(FlexAlign.SpaceAround).width("100%").margin({ bottom: 10 })

        // 开通会员入口
        Row() {
          Column() {
            Row() {
              Image($r(`app.media.rj`)).width(20).height(20)
              Text("成为大会员").font({ size: 14 }).margin(5)
            }

            Row() {
              Text("了解更多权益 >").font({ size: 12 })
            }
          }

          Column() {
            Row() {
              Button("立即开通", {})
            }
          }
        }
        .border({
          color: '#FF0000',
          radius: "2%"
        })
        .width("95%")
        .height("200px")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(10)
        .backgroundColor("#1296db")

        // 使用Scrollable组件包裹需要滚动的内容
        Scroll(this.scroller) {
          Column() {
            //离线等快捷功能
            Row() {
              ForEach(this.shortcutArray, (item: MenuItemIcon) => {
                Column() {
                  Image($r(`${item.icon}`)).width(30).height(40).objectFit(ImageFit.Auto)
                  Text(`${item.name}`).fontSize(12)
                }.onClick(() => {
                  this.pageStark.pushPath({ name: `${item.pathUrls?.name}`, param: null })
                })
              }, (icontext: MenuItemIcon) => icontext.name)


            }.width("100%").justifyContent(FlexAlign.SpaceAround)

            // 创作中心大标题
            Row() {
              Text("创作中心").fontSize(18)
              Button("发布")
            }.justifyContent(FlexAlign.SpaceBetween).width("95%").margin(10)

            // 创作中心icon
            Row() {
              ForEach(this.creationArray, (item: MenuItemIcon) => {
                Column({ space: 5 }) {
                  Image($r(`${item.icon}`))
                    .width(40)
                    .height(40)
                    .objectFit(ImageFit.Auto)

                  Text(`${item.name}`).fontSize(12)
                }
              }, (item: MenuItemIcon) => item.name)
            }.justifyContent(FlexAlign.SpaceAround).width("100%").margin({ bottom: 10 })

            Row() {
              Column() {
                Text("推荐服务").fontSize(18)
              }
            }.width("95%").justifyContent(FlexAlign.SpaceBetween)

            //推荐服务功能网格布局
            Grid() {
              ForEach(this.recommendArray, (item: MenuItemIcon) => {
                GridItem() {
                  Column() {
                    Image($r(`${item.icon}`)).width(30).height(40).objectFit(ImageFit.Auto)
                    Text(`${item.name}`).fontSize(12)
                  }.margin({ bottom: 10 })
                }.onClick(() => {
                  this.pageStark.pushPath({ name: `${item.pathUrls?.name}`, param: null })
                  console.log(`${item.pathUrls?.name}`)
                })
              }, (item: MenuItemIcon) => item.name)
            }.width("100%").columnsTemplate("1fr 1fr 1fr 1fr")

            //list功能区域
            List() {
              ForEach(this.iconLists, (item: MenuItemIcon) => {
                ListItem() {
                  Row({ space: 10 }) {
                    Column() {
                      Image($r(`${item.icon}`))
                        .width(30)
                        .height(40).objectFit(ImageFit.Auto)
                    }.width("10%")

                    Column() {
                      Text(`${item.name}`)
                        .fontSize(12)
                    }.width("70%").alignItems(HorizontalAlign.Start)

                    Column() {
                      Text(`>`)
                        .fontSize(18).margin(10)
                    }.width("10%").alignItems(HorizontalAlign.End)

                  }.width("100%")
                }.margin({ left: 10 }).onClick(() => {
                  this.pageStark.pushPath({ name: `${item.pathUrls?.name}`, param: null })
                })
              }, (item: MenuItemIcon) => item.name)
            }.width("100%").height("100%")
          }
        }
        .width('100%')
        .height('65%') // 设置滚动区域的高度，这是关键！
        .backgroundColor('#f5f5f5') // 方便查看滚动区域的范围
      }.width('100%')
    }
  }
}

