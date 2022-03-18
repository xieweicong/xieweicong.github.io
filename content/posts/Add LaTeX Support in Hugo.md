---
title: "Add_LaTeX_Support_in_Hugo"
date: 2022-03-15T18:11:07+08:00
draft: true
toc: false
images:
tags:
  - hugo
  - github pages
---

## 最简单的方法

通过 CND 导入 JS 的库 [Math Jax](https://www.mathjax.org/) 就可以支持 LaTeX

在当前主题文件夹的 `/layouts/partials/footer.html`中添加

```html
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
></script>
```

之后在 .md 文件中使用$$ $$框住 LaTex 公式即可

```
$$
\dfrac {V}{N}=\dfrac {4\pi }{3}\left( \dfrac {d}{2}\right) ^{3}
$$
```

就会变成

$$
\dfrac {V}{N}=\dfrac {4\pi }{3}\left( \dfrac {d}{2}\right) ^{3}
$$

**注意：** 使用 **Typora** 的时候，输入 $$ 会自动变成公式的编辑框，可以使用 vscode 来单独编辑。



## 某些主题下不生效

在用某些主题下，上面一条不生效，可以使用下面的方法

在当前主题文件夹的 `/layouts/partials/header.html`中添加

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.10.2/dist/katex.min.css" integrity="sha384-yFRtMMDnQtDRO8rLpMIKrtPCD5jdktao2TV19YiZYWMDkUR5GQZR/NOVTdquEx1j" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.10.2/dist/katex.min.js" integrity="sha384-9Nhn55MVVN0/4OFx7EE5kpFBPsEMZxKTCnA+4fqDmg12eCTqGi6+BB2LjY8brQxJ" crossorigin="anonymous"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@0.10.2/dist/contrib/auto-render.min.js" integrity="sha384-kWPLUVMOks5AQFrykwIup5lo0m3iMkkHrD0uJ4H5cjeGihAutqP0yW0J6dpFiVkI" crossorigin="anonymous"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
  renderMathInElement(
      document.body,
      {
          delimiters: [
              {left: "$$", right: "$$", display: true},
              {left: "\\[", right: "\\]", display: true},
              {left: "$", right: "$", display: false},
              {left: "\\(", right: "\\)", display: false}
          ]
      });
  });
</script>
```



---



> 参考：
>
> 1.  https://qiita.com/mametank/items/fa2b8a03598c9548e461) 
> 2. https://tanaken.me/posts/190727/
