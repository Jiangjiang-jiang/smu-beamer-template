# SMU Beamer Theme - 模块化结构说明

## 📁 文件结构

```
smu_template/
├── smu.sty                    # 主包文件（简化版，负责加载模块）
├── smucore/                   # 模块文件夹
│   ├── smucolors.def         # 颜色定义
│   ├── smufonts.def          # 字体配置
│   ├── smucode.def           # 代码高亮样式
│   ├── smucommands.def       # 自定义命令和工具函数
│   ├── smublocks.def         # 自定义块环境
│   └── smutemplates.def      # 页面模板（标题页、章节页等）
├── fonts/                     # 字体文件
└── source/                    # 图片资源
```

## 📦 模块说明

### 1. **smu.sty** - 主包文件
- **功能**: 包的入口文件，负责：
  - 声明包信息和版本
  - 处理包选项（debug/final模式）
  - 加载核心依赖包
  - 设置基本的 Beamer 模板和排版参数
  - 按顺序加载所有子模块

- **大小**: 从 691 行精简到约 100 行
- **修改建议**: 如需添加新的全局依赖包，在此文件中添加

---

### 2. **smucolors.def** - 颜色定义
- **功能**:
  - 定义 SMU 品牌色（smublue, smulightblue, smugold 等）
  - 定义 SCIS 学院色（scisyellow）
  - 定义强调色（mutedred, mutedblue 等）
  - 配置 Beamer 颜色主题
  - 设置超链接颜色

- **修改场景**:
  - 需要添加新的品牌色
  - 调整现有颜色的色值
  - 修改 Beamer 元素的颜色方案

---

### 3. **smufonts.def** - 字体配置
- **功能**:
  - 配置 Calibri 字体（主字体和无衬线字体）
  - 配置 Consolas 等宽字体
  - 设置 Beamer 字体主题（professionalfonts）
  - 定义各种元素的字体大小和样式
  - 设置行距和数学公式间距

- **修改场景**:
  - 更换字体
  - 调整标题、正文等元素的字体大小
  - 修改行距和间距设置

---

### 4. **smucode.def** - 代码高亮样式
- **功能**:
  - 基于 minted 包的代码高亮配置
  - 支持 Pygments 的多种内置样式（solarized-light, monokai, dracula 等）
  - 定义代码高亮颜色（GitHub 风格）
  - 提供便捷的代码环境（ccode, pycode, javacode 等）
  - 提供内联代码命令（\cinline, \pyinline 等）
  - 支持从文件导入代码（\inputcode）

- **修改场景**:
  - 切换代码配色主题（修改 \usemintedstyle 命令）
  - 调整全局代码样式（修改 \setminted 设置）
  - 添加新的语言便捷环境

- **使用示例**:
```latex
\begin{pycode}
def hello_world():
    print("Hello, SMU!")
\end{pycode}

% 或使用原生 minted 环境
\begin{minted}{python}
print("Hello!")
\end{minted}

% 内联代码
\pyinline{x = 42}
```

---

### 5. **smucommands.def** - 自定义命令
- **功能**:
  - 文本格式化命令（`\smucolor`, `\smucode`, `\smulink` 等）
  - 高亮命令（`\shadedtext`, `\shadedmathbox` 等）
  - 彩色加粗命令（`\redbf`, `\bluebf`）
  - 分栏布局快捷命令（`\leftcol`, `\rightcol`, `\midcol`）
  - Section 编号格式化命令

- **修改场景**:
  - 添加新的文本格式化命令
  - 创建自定义的快捷命令

- **使用示例**:
```latex
\smucolor{mutedred}{重要文本}
\shadedtext[smublue]{高亮文本}
\redbf{红色粗体}
```

---

### 6. **smublocks.def** - 自定义块环境
- **功能**:
  - 定义 tagblock 环境（带标签的彩色框）
  - 定义 smublock 环境（SMU 风格的块）
  - 定义 theorembox 环境（定理框）
  - 重定义标准的 block 和 theorem 环境

- **修改场景**:
  - 调整块环境的颜色、边框、圆角等样式
  - 添加新的自定义块环境

- **使用示例**:
```latex
\begin{block}{标题}
  内容...
\end{block}

\begin{theorem}[定理名称]
  定理内容...
\end{theorem}
```

---

### 7. **smutemplates.def** - 页面模板
- **功能**:
  - 定义 SMU 页面头部绘制宏（`\smu@drawheader`）
  - 设置标题页模板
  - 设置帧标题模板
  - 设置页脚和进度条
  - 设置目录样式
  - 定义章节页模板（`\smusectionpage`）
  - 定义感谢页（`\backmatter`）

- **修改场景**:
  - 调整页面布局
  - 修改标题页、章节页的设计
  - 自定义进度条样式

- **使用示例**:
```latex
\backmatter  % 在演示文稿最后插入感谢页
```

---

## 🔧 如何修改和扩展

### 修改现有功能
1. 找到对应的模块文件（.def）
2. 修改相应的设置或定义
3. 保存后重新编译 main.tex

### 添加新功能
1. 在相应的模块文件中添加新的命令或环境
2. 如果需要新的依赖包，在 `smu.sty` 中添加 `\RequirePackage`
3. 如果功能独立且复杂，可以创建新的 .def 文件并在 `smu.sty` 中加载

### 切换代码配色主题
在 `smucore/smucode.def` 中：
1. 找到 `\usemintedstyle{...}` 命令
2. 替换为你想要的 Pygments 样式名称（如 monokai, dracula, vs 等）
3. 重新编译（注意：需要使用 -shell-escape 选项）

---

## ✅ 优势

### 1. **模块化**
- 每个功能模块独立，职责清晰
- 便于团队协作，不同人可以修改不同模块

### 2. **可维护性**
- 代码结构清晰，易于查找和修改
- 主文件只有 100 行左右，一目了然

### 3. **可扩展性**
- 添加新功能只需创建新模块或在现有模块中添加
- 不会影响其他模块的功能

### 4. **易于定制**
- 可以根据需求只修改特定模块
- 支持快速切换主题（如代码配色）

### 5. **版本控制友好**
- Git diff 更清晰
- 减少合并冲突

---

## 📝 使用建议

1. **不要直接修改 `smu.sty`**，除非需要调整模块加载顺序或添加全局依赖
2. **颜色相关修改** → `smucolors.def`
3. **字体相关修改** → `smufonts.def`
4. **代码样式修改** → `smucode.def`
5. **页面布局修改** → `smutemplates.def`
6. **添加新命令** → `smucommands.def`
7. **添加新环境** → `smublocks.def`

---

## 📊 模块依赖关系

```
smu.sty (主文件)
    ├── smucolors.def    (基础：颜色定义)
    ├── smufonts.def     (基础：字体配置)
    ├── smucode.def      (依赖：颜色)
    ├── smucommands.def  (依赖：颜色)
    ├── smublocks.def    (依赖：颜色)
    └── smutemplates.def (依赖：颜色、命令)
```

**加载顺序很重要！** 确保基础模块（颜色、字体）先加载，依赖它们的模块后加载。

---

## 🎨 版本历史

### v2.0.0 (2026/01/26)
- 统一所有模块文件的版本号和日期
- 修复 smufonts.def 中的重复参数
- 优化代码逻辑一致性（统一使用 section 编号格式化命令）
- 更新 README 文档

### v1.0.3 (2025/01/25)
- 将单文件 691 行的 smu.sty 拆分为模块化结构
- 创建 6 个功能模块文件
- 主文件精简到约 100 行
- 保持所有原有功能不变

---

## 📧 联系方式

如有问题或建议，请联系：qsang

**Happy LaTeX-ing! 🎓**
