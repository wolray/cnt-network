<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Gui</a>
<ul>
<li><a href="#sec-1-1">1.1. Menu Bar</a></li>
<li><a href="#sec-1-2">1.2. Tool Bar</a>
<ul>
<li><a href="#sec-1-2-1">1.2.1. Viewer</a></li>
<li><a href="#sec-1-2-2">1.2.2. Do-file Editor</a></li>
<li><a href="#sec-1-2-3">1.2.3. Data Editor</a></li>
<li><a href="#sec-1-2-4">1.2.4. Variables Manager</a></li>
</ul>
</li>
<li><a href="#sec-1-3">1.3. Review Window</a>
<ul>
<li><a href="#sec-1-3-1">1.3.1. Options</a></li>
</ul>
</li>
<li><a href="#sec-1-4">1.4. Results Window</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Preferences</a></li>
</ul>
</li>
<li><a href="#sec-1-5">1.5. Command Window</a></li>
<li><a href="#sec-1-6">1.6. Variables Window</a></li>
</ul>
</li>
<li><a href="#sec-2">2. Recommanded Global Set</a>
<ul>
<li><a href="#sec-2-1">2.1. Font</a></li>
<li><a href="#sec-2-2">2.2. Scheme</a>
<ul>
<li><a href="#sec-2-2-1">2.2.1. Classic</a></li>
</ul>
</li>
<li><a href="#sec-2-3">2.3. Init-file</a>
<ul>
<li><a href="#sec-2-3-1">2.3.1. "profile.do"</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-3">3. Shortcut</a>
<ul>
<li><a href="#sec-3-1">3.1. Main Window</a>
<ul>
<li><a href="#sec-3-1-1">3.1.1. Ctrl-o open-file</a></li>
<li><a href="#sec-3-1-2">3.1.2. Ctrl-n open-new-window/file</a></li>
<li><a href="#sec-3-1-3">3.1.3. F1 help ("h")</a></li>
<li><a href="#sec-3-1-4">3.1.4. F2 describe ("d")</a></li>
<li><a href="#sec-3-1-5">3.1.5. F7 save</a></li>
<li><a href="#sec-3-1-6">3.1.6. F8 use</a></li>
</ul>
</li>
<li><a href="#sec-3-2">3.2. Do-file Shortcut</a>
<ul>
<li><a href="#sec-3-2-1">3.2.1. Ctrl-r (run selected region or run whole file)</a></li>
<li><a href="#sec-3-2-2">3.2.2. Ctrl-l (select current line)</a></li>
<li><a href="#sec-3-2-3">3.2.3. Ctrl-g (go to line)</a></li>
<li><a href="#sec-3-2-4">3.2.4. Ctrl-s/x/c/v</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-4">4. Editor</a>
<ul>
<li><a href="#sec-4-1">4.1. Basic</a>
<ul>
<li><a href="#sec-4-1-1">4.1.1. Comment</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-5">5. Data Processing 数据处理</a>
<ul>
<li><a href="#sec-5-1">5.1. Commonly used command 常用命令</a>
<ul>
<li><a href="#sec-5-1-1">5.1.1. cd (current work-directory) 指定当前工作路径</a></li>
<li><a href="#sec-5-1-2">5.1.2. set 指定系统参数,如</a></li>
<li><a href="#sec-5-1-3">5.1.3. display [exp] 显示结果，可直接跟数学函数</a></li>
<li><a href="#sec-5-1-4">5.1.4. dir (directory) 显示当前目录下的文件</a></li>
<li><a href="#sec-5-1-5">5.1.5. clear 清除内存，即储存的变量</a></li>
<li><a href="#sec-5-1-6">5.1.6. exit 退出stata</a></li>
</ul>
</li>
<li><a href="#sec-5-2">5.2. System variables 系统变量</a>
<ul>
<li><a href="#sec-5-2-1">5.2.1. _n 当前观测值所在行</a></li>
<li><a href="#sec-5-2-2">5.2.2. _N 变量最大行数</a></li>
<li><a href="#sec-5-2-3">5.2.3. _pi</a></li>
</ul>
</li>
<li><a href="#sec-5-3">5.3. Output variables</a>
<ul>
<li><a href="#sec-5-3-1">5.3.1. _b[varname] 最近模型估算之后得到的系数</a></li>
<li><a href="#sec-5-3-2">5.3.2. _cons (<sub>b[</sub><sub>cons]</sub>) 最近模型估算后的常数项</a></li>
<li><a href="#sec-5-3-3">5.3.3. _se[varname] 最近模型估算后的标准误差</a></li>
</ul>
</li>
<li><a href="#sec-5-4">5.4. File type 文件类型</a>
<ul>
<li><a href="#sec-5-4-1">5.4.1. .dta (data-file) 数据文件</a></li>
<li><a href="#sec-5-4-2">5.4.2. .do do文件，即你自己写的脚本</a></li>
<li><a href="#sec-5-4-3">5.4.3. .ado 运行程序文件</a></li>
</ul>
</li>
<li><a href="#sec-5-5">5.5. Basic syntax</a>
<ul>
<li><a href="#sec-5-5-1">5.5.1. [prefix] command [varlist] [=exp] [if exp] [in range] [,options]</a></li>
</ul>
</li>
<li><a href="#sec-5-6">5.6. merge 横向合并</a></li>
<li><a href="#sec-5-7">5.7. append 纵向合并</a></li>
</ul>
</li>
</ul>
</div>
</div>

# Gui<a id="sec-1" name="sec-1"></a>

## Menu Bar<a id="sec-1-1" name="sec-1-1"></a>

## Tool Bar<a id="sec-1-2" name="sec-1-2"></a>

### Viewer<a id="sec-1-2-1" name="sec-1-2-1"></a>

### Do-file Editor<a id="sec-1-2-2" name="sec-1-2-2"></a>

### Data Editor<a id="sec-1-2-3" name="sec-1-2-3"></a>

### Variables Manager<a id="sec-1-2-4" name="sec-1-2-4"></a>

## Review Window<a id="sec-1-3" name="sec-1-3"></a>

### Options<a id="sec-1-3-1" name="sec-1-3-1"></a>

## Results Window<a id="sec-1-4" name="sec-1-4"></a>

### Preferences<a id="sec-1-4-1" name="sec-1-4-1"></a>

1.  Result Colors

    1.  Color Scheme (recommanded: Classic)

## Command Window<a id="sec-1-5" name="sec-1-5"></a>

## Variables Window<a id="sec-1-6" name="sec-1-6"></a>

# Recommanded Global Set<a id="sec-2" name="sec-2"></a>

## Font<a id="sec-2-1" name="sec-2-1"></a>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="left" />

<col  class="right" />

<col  class="left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Windows in Stata</th>
<th scope="col" class="left">Style</th>
<th scope="col" class="right">Size</th>
<th scope="col" class="left">Device</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">Review Window</td>
<td class="left">Courier New</td>
<td class="right">9</td>
<td class="left">laptop</td>
</tr>


<tr>
<td class="left">Results Window</td>
<td class="left">Courier New</td>
<td class="right">11</td>
<td class="left">laptop</td>
</tr>


<tr>
<td class="left">Command Window</td>
<td class="left">Courier New</td>
<td class="right">11</td>
<td class="left">laptop</td>
</tr>


<tr>
<td class="left">Variables Window</td>
<td class="left">Courier New</td>
<td class="right">9</td>
<td class="left">laptop</td>
</tr>
</tbody>
</table>

## Scheme<a id="sec-2-2" name="sec-2-2"></a>

### Classic<a id="sec-2-2-1" name="sec-2-2-1"></a>

## Init-file<a id="sec-2-3" name="sec-2-3"></a>

### "profile.do"<a id="sec-2-3-1" name="sec-2-3-1"></a>

1.  directory

    1.  C:/Program Files/Stata13/

2.  contens

    1.  cd your-work-directory

    2.  set more off

# Shortcut<a id="sec-3" name="sec-3"></a>

## Main Window<a id="sec-3-1" name="sec-3-1"></a>

### Ctrl-o open-file<a id="sec-3-1-1" name="sec-3-1-1"></a>

### Ctrl-n open-new-window/file<a id="sec-3-1-2" name="sec-3-1-2"></a>

### F1 help ("h")<a id="sec-3-1-3" name="sec-3-1-3"></a>

### F2 describe ("d")<a id="sec-3-1-4" name="sec-3-1-4"></a>

### F7 save<a id="sec-3-1-5" name="sec-3-1-5"></a>

### F8 use<a id="sec-3-1-6" name="sec-3-1-6"></a>

## Do-file Shortcut<a id="sec-3-2" name="sec-3-2"></a>

### Ctrl-r (run selected region or run whole file)<a id="sec-3-2-1" name="sec-3-2-1"></a>

### Ctrl-l (select current line)<a id="sec-3-2-2" name="sec-3-2-2"></a>

### Ctrl-g (go to line)<a id="sec-3-2-3" name="sec-3-2-3"></a>

### Ctrl-s/x/c/v<a id="sec-3-2-4" name="sec-3-2-4"></a>

# Editor<a id="sec-4" name="sec-4"></a>

## Basic<a id="sec-4-1" name="sec-4-1"></a>

### Comment<a id="sec-4-1-1" name="sec-4-1-1"></a>

1.  tail-comment

    1.  "//your-comment-here"

2.  inline-comment

    1.  "***your-comment-here***"

# Data Processing 数据处理<a id="sec-5" name="sec-5"></a>

## Commonly used command 常用命令<a id="sec-5-1" name="sec-5-1"></a>

### cd (current work-directory) 指定当前工作路径<a id="sec-5-1-1" name="sec-5-1-1"></a>

### set 指定系统参数,如<a id="sec-5-1-2" name="sec-5-1-2"></a>

1.  set more off/on 是否在输出窗口显示 more

2.  set obs 设定观测值行数

3.  set maxvar 设定最大变量数(列数)

4.  set memory 设定最大内存占用

### display [exp] 显示结果，可直接跟数学函数<a id="sec-5-1-3" name="sec-5-1-3"></a>

### dir (directory) 显示当前目录下的文件<a id="sec-5-1-4" name="sec-5-1-4"></a>

### clear 清除内存，即储存的变量<a id="sec-5-1-5" name="sec-5-1-5"></a>

### exit 退出stata<a id="sec-5-1-6" name="sec-5-1-6"></a>

## System variables 系统变量<a id="sec-5-2" name="sec-5-2"></a>

### \_n 当前观测值所在行<a id="sec-5-2-1" name="sec-5-2-1"></a>

### \_N 变量最大行数<a id="sec-5-2-2" name="sec-5-2-2"></a>

### \_pi<a id="sec-5-2-3" name="sec-5-2-3"></a>

## Output variables<a id="sec-5-3" name="sec-5-3"></a>

### \_b[varname] 最近模型估算之后得到的系数<a id="sec-5-3-1" name="sec-5-3-1"></a>

### \_cons (<sub>b[</sub><sub>cons]</sub>) 最近模型估算后的常数项<a id="sec-5-3-2" name="sec-5-3-2"></a>

### \_se[varname] 最近模型估算后的标准误差<a id="sec-5-3-3" name="sec-5-3-3"></a>

## File type 文件类型<a id="sec-5-4" name="sec-5-4"></a>

### .dta (data-file) 数据文件<a id="sec-5-4-1" name="sec-5-4-1"></a>

### .do do文件，即你自己写的脚本<a id="sec-5-4-2" name="sec-5-4-2"></a>

### .ado 运行程序文件<a id="sec-5-4-3" name="sec-5-4-3"></a>

## Basic syntax<a id="sec-5-5" name="sec-5-5"></a>

### [prefix] command [varlist] [=exp] [if exp] [in range] [,options]<a id="sec-5-5-1" name="sec-5-5-1"></a>

## merge 横向合并<a id="sec-5-6" name="sec-5-6"></a>

**\***

## append 纵向合并<a id="sec-5-7" name="sec-5-7"></a>
