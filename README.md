# JHBadge
Tabbar Badge，标签栏红点

---

# Usage
```
// show
[self.tabBarController.tabBar jh_showRedDot:0 number:@(arc4random()%20+1).stringValue];

// hide
[self.tabBarController.tabBar jh_hideRedDot:0];
```

---

# Notice

1.在自定义的 `UITabBarController` 中，在方法 `viewDidLoad` 内直接调用 
```
[self.tabBar jh_showRedDot:3];
```
会有 bug.

此时，方法内部获取到的 `self.items.count` 为 0

需要在调用此方法之前，先调用一下
```
self.selectedIndex = 0;
```
才能正确获取到 `self.items.count`。

--- 2023-02-28 11:20:27

---

# Logs

### 2020-01-17
- upload.


