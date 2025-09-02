// 接口：可以通过继承或类型断言来扩展类型。
export interface MenuItemIcon {
  name: string;
  icon: string;
  pathUrls?: NavPathInfo;
  NetworkRequestUrls?: string;
}

export interface SwiperFu {
  id: string,
  swiperMain: string
}