!macro customHeader
    # 自定义头部设置
    !system "echo %productName% > temp.txt"
    !searchreplace PRODUCT_NAME temp.txt "%productName%" `${productName}`
!macroend

!macro customInstall
    # 安装时的自定义操作
    WriteRegStr HKCU "Software\${PRODUCT_NAME}" "" $INSTDIR
    
    # 创建开始菜单快捷方式
    CreateDirectory "$SMPROGRAMS\${PRODUCT_NAME}"
    CreateShortcut "$SMPROGRAMS\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_NAME}.exe"
    
    # 创建桌面快捷方式
    CreateShortcut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\${PRODUCT_NAME}.exe"
!macroend

!macro customUnInstall
    # 卸载时的自定义操作
    DeleteRegKey HKCU "Software\${PRODUCT_NAME}"
    
    # 删除开始菜单快捷方式
    RMDir /r "$SMPROGRAMS\${PRODUCT_NAME}"
    
    # 删除桌面快捷方式
    Delete "$DESKTOP\${PRODUCT_NAME}.lnk"
    
    # 清理安装目录
    RMDir /r "$INSTDIR"
!macroend