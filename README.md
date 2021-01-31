# USTC-home-jekyll

想要快速在 [home.ustc.edu.cn](http://home.ustc.edu.cn) 或者 [staff.ustc.edu.cn](http://staff.ustc.edu.cn) 创建一个好看的主页？这个仓库就是你在找的资源！

## 如何使用

首先，[Fork](https://github.com/iBug/USTC-home-jekyll/fork) 这个仓库到你自己的账号下。

在这里添加两个值：

| 名称 (NAME) | 内容 (VALUE)                                                |
| ----------- | ----------------------------------------------------------- |
| `EMAIL`     | 你的科大邮箱，以 `@mail.ustc.edu.cn` 或 `@ustc.edu.cn` 结尾 |
| `PASSWORD`  | 你的邮箱密码，用来通过 FTP 传输你的主页                     |

然后，在你 Fork 的仓库中编辑 `_config.yml` 文件，找到 `baseurl:` 这一行，把它的值改成 `/~` 后面跟上你的邮箱用户名部分。例如，如果你的邮箱是 `example@mail.ustc.edu.cn`，那么 `baseurl:` 后面就是 `/~example`。如果你的邮箱是以 `@ustc.edu.cn` 结尾的，那么你还应该把 `url:` 这一行改成 `http://staff.ustc.edu.cn`。

点击下面绿色的 Commit changes 按钮，等待 2~3 分钟（第一次推送时间会比较长），你就可以在 `http://home.ustc.edu.cn/~username` 这里看到你的新主页了，[就像这样](http://home.ustc.edu.cn/~ibug)：

![Preview](https://image.ibugone.com/USTC-home-jekyll/preview.png)
