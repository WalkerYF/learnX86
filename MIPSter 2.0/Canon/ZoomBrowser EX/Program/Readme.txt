----------------------------------------------------------------------------
                       Canon Utilities ZoomBrowser EX
                                  自述文件

                                  版本 5.7
----------------------------------------------------------------------------
                      版权所有 (C) 2002-2006 Canon Inc.
----------------------------------------------------------------------------
本文件包含有关 ZoomBrowser EX 的重要信息。请仔细阅读本文件的内容。
----------------------------------------------------------------------------


目录
----

1. 设备设置
2. 从 ZoomBrowser EX 版本 2/版本 3 升级
3. 发送电子邮件
4. 备份到 CD（仅限 Windows XP）
5. 只读图像/文件夹
6. 使用颜色管理功能
7. 其它问题
8. Acknowledgments
9. Copyrights


1. 设备设置
-----------

(1) 显卡设置

    缩放操作有时看起来会较慢，不是非常顺畅。这可能与您的计算机及其显卡有关。
    如果出现上述症状，请调整计算机上 [显示适配器属性] 对话框的 [性能]/
    [疑难解答] 选项卡中的 [硬件加速] 滑块控件，将该滑块设置为比 [全] 低一
    个格。

(2) 显示设置

    您可以使用 [显示属性] 对话框的 [设置] 选项卡来查看或更改计算机的显示
    设置。
    可以从计算机的 [控制面板] 访问 [显示属性] 对话框。

(2.1) 在使用 [大字体] 显示设置时，某些文本在默认的窗口大小上可能无法显示
      出来。

      如果您的计算机选择了 [大字体] 显示设置，则 ZoomBrowser EX 
      任务步骤窗口中的某些文本在默认的窗口大小上可能无法显示出来。
      如果发生此情况，请调整 ZoomBrowser EX 窗口的大小，
      以便所有文本都可以显示出来。

(2.2) 在某些操作系统上，避免使用 16 位增强色显示设置

      对于采用 16 位增强色模式的 Windows 98 用户，ZoomBrowser EX 
      界面的图形显示可能不太正常。
      通过将 [颜色] 显示设置更改为 24 位真彩色或更高位数的颜色，
      可以解决上述问题。


2. 从 ZoomBrowser EX 版本 2/版本 3 升级
---------------------------------------

如果您使用 ZoomBrowser EX 版本 2 或版本 3 向图像添加了注释或标题，
则必须先运行一个数据库转换器工具，然后才能在此版本的 ZoomBrowser EX 
中查看这些注释/标题。
该数据库转换器工具名为 dbconverter.exe，可以在此版本 ZoomBrowser EX 
的安装位置找到。


3. 发送电子邮件
---------------

(1) 需要 MAPI 支持

    要使电子邮件工具可以正常使用，需要首先安装兼容的 Mapi32.dll。
    在您的常用电子邮件程序中启用了 MAPI 通信后，会安装 Mapi32.dll。
    如果当前安装了较旧的 Mapi32.dll 不兼容版本，
    并且在您的常用电子邮件程序中未启用 MAPI，则在此程序中启用 MAPI 
    时将会安装兼容的 Mapi32.dll。
    如果在电子邮件程序中已启用了 MAPI，则需要升级该电子邮件程序并启用 MAPI。


4. 备份到 CD（仅限 Windows XP）
------------------------------

(1) 当 CD 可用空间不足时显示错误信息并且发生备份失败

    ZoomBrowser EX 可能会显示一则消息，指示在备份到 CD 任务的最后阶段该 CD 
    上的空间不足。
    如果所选图像的总大小非常接近于 CD 上的总可用空间大小，并且在该 CD 
    上没有足够的空间来存储其它一些 ZoomBrowser EX 信息文件，将发生此情况。
    发生此情况时，所选图像不会复制到 CD 上。
    请减少所选图像的数量并再次开始备份到 CD 任务。

(2) 在备份到 CD 期间不要关闭 CD 烧录机的电源
    
    在执行备份到 CD 任务时，请勿关闭 CD 烧录机的电源，否则可能导致 
    ZoomBrowser EX 中出现错误。
    如果发生这一情况，请重新启动 ZoomBrowser EX。

(3) 当其它 CD 烧录软件处于打开状态时，备份到 CD 操作可能会失败，并且 
    ZoomBrowser EX 可能无法备份文件。如果发生这种情况，请关闭其它所有 CD 
    烧录软件，然后再次开始备份到 CD 任务。


5. 只读图像/文件夹
------------------

您可以浏览只读文件夹或光盘中的图像，但不能将注释与这些文件夹中的图像相关联。
此限制同样适用于标记为只读的图像。
如果您确实想为只读图像保存注释，请使用 Windows 
资源管理器清除此图像的只读复选框。


6. 使用颜色管理功能
-------------------

(1) 启用颜色管理

    [首选项] > [常规] 选项卡上现在包含可选择的 [颜色管理] 选项。
    启用此选项后，ZoomBrowser EX 中显示的图像颜色与显示器 ICC 
    配置文件保持一致，以使颜色保持一致。

    默认情况下，颜色管理功能处于关闭状态。

(2) 支持的图像类型

    对于以下类型的图像而言，如果能够从中检索颜色空间信息
   （包括 ICC 配置文件），则会对它们执行颜色管理：

    - Exif JPEG
    - Exif TIFF
    - RAW
      
    ZoomBrowser EX 不会对任何其它图像类型执行颜色管理。

    注意：当 ZoomBrowser EX 正在运行时，如果更改了显示器的颜色配置文件，则 
    ZoomBrowser EX 将继续使用启动时所使用的颜色配置文件。
    要使 ZoomBrowser EX 使用新的显示器颜色配置文件，请关闭 ZoomBrowser EX，
    然后重新启动该应用程序。

(3) 支持颜色管理的 Canon Utilities

    以下 Canon Utilities 支持颜色管理：

    - CameraWindow 5.1 或更高版本
    - RAW Image Task 2.0.1 或更高版本


7. 其它问题
-----------

(1) 在远景拍摄应用程序异常终止后启动 ZoomBrowser EX
    
    如果远景拍摄应用程序异常终止，之后您可能无法启动 ZoomBrowser EX。
    如果发生上述情况，请重新启动您的计算机。

(2) 避免使用其它工具处理正在 ZoomBrowser EX 中查看的图像

    当您在 ZoomBrowser EX 中查看图像时，建议您不要使用其它应用程序删除、
    移动或更改这些图像中的任何图像。

(3) 避免使用过长的文件/文件夹名称

    在某些操作系统上，如果尝试访问名称过长的文件或文件夹，ZoomBrowser EX 
    可能会出现异常。
    如果发生此情况，请将文件/文件夹的名称更改为较短的名称。

(4) 不要在 ZoomBrowser EX 正在运行时卸载 ZoomBrowser EX

    如果您尝试在 ZoomBrowser EX 正运行时卸载它，将只会执行部分卸载工作，
    并且只删除某些文件。
    请不要在 ZoomBrowser EX 正运行时卸载它。

(5) 使用 File Viewer Utility、EOS Viewer Utility 或 Digital Photo 
    Professional 旋转的图像在 ZoomBrowser EX 中可能无法正确显示

    ZoomBrowser EX 可能无法正确显示使用 File Viewer Utility、EOS Viewer 
    Utility 或 Digital Photo Professional 旋转后的图像。
    如果发生此情况，请使用 Windows 资源管理器重命名或复制该图像，然后在 
    ZoomBrowser EX 中查看新图像。
    新图像应可以正确显示。

(6) 不支持的图像类型

    某些图像类型有许多变种。ZoomBrowser EX 可能不支持所有这些变种，因此，
    可能无法正确显示不支持的图像。
    要在 ZoomBrowser EX 中查看此类图像，
    请在支持其特定类型的图像编辑器中打开该图像，然后用 ZoomBrowser EX 
    支持的类型（例如 JPEG 类型）保存该图像。

(7) 在幻灯片放映期间不要弹出 CD

    请不要弹出 ZoomBrowser EX 幻灯片放映正从其显示图像的 CD，
    因为这样做可能会导致错误。
    如果发生此错误，请退出 ZoomBrowser EX，然后重新启动它。

(8) Windows 98 上的菜单中未提供 [复制] 功能

    在 Windows 98 上，ZoomBrowser EX 的 [编辑] 菜单或右键单击菜单未提供 
    [复制] 功能。
    您可以通过在按下键盘上的 Ctrl 键的同时拖放图像/文件夹来进行复制或粘贴。

(9) 将 RAW 图像发送给 [布局打印] 任务

    如果选择 RAW 文件并启动 [布局打印] 任务，或者启动 [使用其它软件打印] 
    任务并单击 [联系页打印]，可以将 RAW 图像发送给 PhotoRecord。
    在两种情况下，系统就会将此 RAW 文件转换为临时文件并打印该临时文件。
    因此，如果保存的是包含 RAW 文件的相册，则打开相册时可能看不到此 RAW 
    文件。在这种情况下，请使用 [处理 RAW 图像] 任务对 RAW 图像进行转换并将
    其另存为其它图像类型，然后将此新图像添加到相册中。


8. Acknowledgments
------------------

This software is based in part on the work of the Independent JPEG Group. 


9. Copyrights
-------------

TIFF:

Copyright (c) 1988-1997 Sam Leffler
Copyright (c) 1991-1997 Silicon Graphics, Inc.
 
Permission to use, copy, modify, distribute, and sell this software and its 
documentation for any purpose is hereby granted without fee, provided that:

1. The above copyright notices and this permission notice appear in all 
   copies of the software and related documentation.

2. The names of Sam Leffler and Silicon Graphics may not be used in any 
   advertising or publicity relating to the software without the specific, 
   prior written permission of Sam Leffler and Silicon Graphics.

IJG:

Permission is hereby granted to use, copy, modify, and distribute this 
software (or portions thereof) for any purpose, without fee, subject to 
these conditions:

1. If any part of the source code for this software is distributed, then 
   this README file must be included, with this copyright and no-warranty 
   notice unaltered; and any additions, deletions, or changes to the 
   original files must be clearly indicated in accompanying documentation.

2. If only executable code is distributed, then the accompanying 
   documentation must state that "this software is based in part on the 
   work of the Independent JPEG Group".

3. Permission for use of this software is granted only if the user accepts 
   full responsibility for any undesirable consequences; the authors accept 
   NO LIABILITY for damages of any kind.

These conditions apply to any software derived from or based on the IJG 
code, not just to the unmodified library.  If you use our work, you ought 
to acknowledge us.

Permission is NOT granted for the use of any IJG author's name or company 
name in advertising or publicity relating to this software or products 
derived from it. This software may be referred to only as "the Independent 
JPEG Group's software".

We specifically permit and encourage the use of this software as the basis 
of commercial products, provided that all warranty or liability claims are 
assumed by the product vendor.

PIXOLOGY:

Copyright (c) 2002-2004, Pixology Software Ltd.

MICROSOFT:

Portions utilize Microsoft Windows Media Technologies.
Copyright (c) 2004 Microsoft Corporation. All Rights Reserved.

<ZH><EOF>
