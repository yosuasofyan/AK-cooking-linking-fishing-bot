#MaxThreadsPerHotkey 2
#SingleInstance, Force
#NoEnv
#Include, Gdip.ahk
SetDefaultMouseSpeed, 0
SetKeyDelay, 100

eido1 = 
eido2 = 
eido3 = 
eido4 = 
xreso = 
yreso = 
cooking = 
beads = 
fishing =

talk(x,y){
    global xreso
    global yreso
    MouseClick, left, x, y, 1
    while 1 
    {   
        found:=0
        ImageSearch, O, P, 0, 0, xreso, yreso, textbubble.png
        if (ErrorLevel = 1)
        {   
            MouseClick, left, x, y, 1
            Continue
        }
        MouseClick, left, O, P, 1
        Sleep 200
        ImageSearch, AA, BB, 0, 0, xreso, yreso, talklater.png
        if (ErrorLevel = 0)
        {
            startlinking(0,0)
            Break
        }
        ImageSearch, XX, YY, 0, 0, xreso, yreso, verify.png
        if (ErrorLevel = 1)
        {
            Continue
        }
        MouseMove, 10, 10
        

        
        Loop, Files, combined\*.png
        { 
            ImageSearch, K, L, 0, 0, xreso, yreso, %A_LoopFileFullPath%
            if (ErrorLevel = 0)
            {
                found:=1
                MouseClick, left, K, L, 1
                Break
            }
        }
        if found=0
        {   
            G:=P+35
            MouseClick, left, O, G, 1
        }
        MouseClick, left, x, y, 1
    }
}

receive(x,y){
    global xreso
    global yreso
    MouseClick, left, x, y, 1 
    Sleep 250   
    ImageSearch, Q, W, 0, 0, xreso, yreso, receive.png
    if (ErrorLevel = 0){  
        Sleep 100
        MouseClick, left, Q, W, 1        
    }
}

startlinking(x,y){
    global xreso
    global yreso
    if (x!=0)
    {
        MouseClick, left, x, y, 1
    }
    ImageSearch, SS, DD, 0, 0, xreso, yreso, link.png
    if (ErrorLevel = 0){
        MouseClick, left, SS, DD, 1
        Sleep 250
        ImageSearch, FF, GG, 0, 0, xreso, yreso, ok.png
        if (ErrorLevel = 0){
            MouseClick, left, FF, GG, 1
            MouseMove, 10, 10
        }
    }else{
        ImageSearch, SS, DD, 0, 0, xreso, yreso, link3.png
        if (ErrorLevel = 0){
            MouseClick, left, SS, DD, 1
            Sleep 250
            ImageSearch, FF, GG, 0, 0, xreso, yreso, ok.png
            if (ErrorLevel = 0){
                MouseClick, left, FF, GG, 1
                MouseMove, 10, 10
            }
        }
    }    
}

feed(eido){
    global xreso
    global yreso
    Send {n Down}
    Sleep, 20
    Send {n Up}
    Sleep 1000
    ImageSearch, N, M, 0, 0, xreso, yreso, %eido%2.png
    MouseClick, left, N, M, 1
    Sleep 300
    ImageSearch, N, M, 0, 0, xreso, yreso, feed.png
    MouseClick, left, N, M, 1
    Sleep 300
    ImageSearch, N, M, 0, 0, xreso, yreso, bead.png
    X:=N+170
    MouseClick, left, X, M, 1
    Sleep 300
    ImageSearch, A, B, 0, 0, xreso, yreso, ok.png
    MouseClick, left, A, B, 1
    Sleep 300
    MouseClick, left, X, M, 1
    Sleep 300
    MouseClick, left, A, B, 1

    Send {n Down}
    Sleep, 20
    Send {n Up}
    Sleep 200
}

Screenshot(outfile){
    pToken := Gdip_Startup()

    screen=0|0|%A_ScreenWidth%|%A_ScreenHeight%
    pBitmap := Gdip_BitmapFromScreen(screen)

    Gdip_SaveBitmapToFile(pBitmap, outfile, 100)
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)
}

cook(x,y){
    global xreso
    global yreso
    While True
    {	
        ImageSearch, Q, W, 0, 0, xreso, yreso, products.png
        if (ErrorLevel = 1)
        {	
            SetMouseDelay, 350
            MouseClick, right, %x%, %y%, 1
            Sleep, 300
            MouseMove, 10, 10
            ImageSearch, O, P, 0, 0, xreso, yreso, manualbutton.png
            if (ErrorLevel = 1)
            {	
                Break
            } else {	
                
                O:=O+30
                P:=P+10
                MouseClick, left, O, P, 1
                Sleep, 1000
                ImageSearch, A, B, 0, 0, xreso, yreso, wrong.png
                if (ErrorLevel != 2 and ErrorLevel != 1){
                    File1 = wrongingredient.png
                    pToken := Gdip_Startup()
                    Screenshot(File1)
                    B:=B+33
                    Loop, 3
                    {   
                        C := A+(47*(A_Index-1)) 
                        pBitmap := Gdip_CreateBitmap(8, 12)
                        G := Gdip_GraphicsFromImage(pBitmap)
                        pBitmapFile1 := Gdip_CreateBitmapFromFile(File1)
                        Width := Gdip_GetImageWidth(pBitmapFile1), Height := Gdip_GetImageHeight(pBitmapFile1)
                        Gdip_DrawImage(G, pBitmapFile1, 0, 0, Width, Height, C, B, Width, Height)
                        Gdip_DisposeImage(pBitmapFile1)

                        filename = w%A_Index%.png
                        Gdip_SaveBitmapToFile(pBitmap, filename)
                        Gdip_DisposeImage(pBitmap)
                        Gdip_DeleteGraphics(G)
                    }
                    Gdip_Shutdown(pToken)
                }
                Sleep, 4500
            }           
        } else {
            SetMouseDelay, 10
            Q:=Q+565
            W:=W+95
            ImageSearch, A, B, 0, 0, xreso, yreso, w1.png
            if (ErrorLevel != 2 and ErrorLevel != 1){
                MouseClick, left, A, B, 2
                MouseMove, Q, W
            }
            ImageSearch, C, D, 0, 0, xreso, yreso, w2.png
            if (ErrorLevel != 2 and ErrorLevel != 1){
                MouseClick, left, C, D, 2
                MouseMove, Q, W
            }
            ImageSearch, E, F, 0, 0, xreso, yreso, w3.png
            if (ErrorLevel != 2 and ErrorLevel != 1){
                MouseClick, left, E, F, 2
                MouseMove, Q, W
            }
        }
    }
}

F9::
if(cooking=1){
    cook(805,645)
    cook(845,645)
    cook(885,645)
    cook(925,645)
    cook(965,645)
    cook(1000,645)
    ImageSearch, O, P, 0, 0, xreso, yreso, cost.png
    Send {Esc down}
    Sleep, 20
    Send {Esc up}
}
While True
{	
    if WinExist("Aura Kingdom Online                 "){
        WinActivate
    }
    SetMouseDelay, 400
    MouseMove, 10, 10
    ImageSearch, V, B, 0, 0, xreso, yreso, link.png
    if (ErrorLevel = 1){
        ImageSearch, V, B, 0, 0, xreso, yreso, link3.png
        if (ErrorLevel = 1){
            Send {h Down}
            Sleep, 20
            Send {h Up}
            ;Sleep 200
            ;Continue
        }
    }

    ImageSearch, V, B, 0, 0, xreso, yreso, %eido1%finished.png
    if (ErrorLevel = 0){
        receive(V,B)
    }
    ImageSearch, Q, W, 0, 0, xreso, yreso, %eido2%finished.png
    if (ErrorLevel = 0){
        receive(Q,W)
    }
    ImageSearch, Z, X, 0, 0, xreso, yreso, %eido3%finished.png
    if (ErrorLevel = 0){
        receive(Z,X)
    }
    ImageSearch, C, V, 0, 0, xreso, yreso, %eido4%finished.png
    if (ErrorLevel = 0){
        receive(C,V)
    }

    if (beads=1){
        ImageSearch, V, B, 0, 0, xreso, yreso, %eido2%low.png
        if (ErrorLevel = 0){
            feed(eido2)
        }
        ImageSearch, V, B, 0, 0, xreso, yreso, %eido3%low.png
        if (ErrorLevel = 0){
            feed(eido3)
        }
        ImageSearch, V, B, 0, 0, xreso, yreso, %eido4%low.png
        if (ErrorLevel = 0){
            feed(eido4)
        }
    }

    ImageSearch, V, B, 0, 0, xreso, yreso, %eido1%low.png
    if (ErrorLevel = 1){
        ImageSearch, V, B, 0, 0, xreso, yreso, %eido1%.png
        if (ErrorLevel = 0){
            startlinking(V,B)
        }

    }

    ImageSearch, Q, W, 0, 0, xreso, yreso, %eido2%.png
    if (ErrorLevel = 0){
        startlinking(Q,W)
    }
    ImageSearch, Z, X, 0, 0, xreso, yreso, %eido3%.png
    if (ErrorLevel = 0){
        startlinking(Z,X)
    }
    ImageSearch, C, V, 0, 0, xreso, yreso, %eido4%.png
    if (ErrorLevel = 0){
        startlinking(C,V)
    }

    ImageSearch, V, B, 0, 0, xreso, yreso, %eido1%talk.png
    if (ErrorLevel = 0){
        talk(V,B)
    }
    ImageSearch, Q, W, 0, 0, xreso, yreso, %eido2%talk.png
    if (ErrorLevel = 0){
        talk(Q,W)
    }
    ImageSearch, Z, X, 0, 0, xreso, yreso, %eido3%talk.png
    if (ErrorLevel = 0){
        talk(Z,X)
    }
    ImageSearch, C, V, 0, 0, xreso, yreso, %eido4%talk.png
    if (ErrorLevel = 0){
        talk(C,V)
    }
    if (fishing=1){
        while true {
            ImageSearch, Q, W, 0, 0, xreso, yreso, tutorial.png
            if (ErrorLevel = 1){
                ImageSearch, F, G, 0, 0, xreso, yreso, startfishing.png
                if (ErrorLevel = 0){  
                    SetMouseDelay, 100
                    MouseMove, F, G
                    MouseClick, right, F, G, 1
                    SetMouseDelay, 400
                    Sleep 400
                }    
            }
            ImageSearch, Q, W, 0, 0, xreso, yreso, tutorial.png
            if (ErrorLevel = 0){
                Q:=Q+125
                MouseClick, left, Q, W, 1
                Sleep 5500
                MouseClick, left, Q, W, 1
                Sleep 300
                While True {
                    ImageSearch, E, R, 0, 0, xreso, yreso, faceright.png
                    if (ErrorLevel = 0){
                        rite:=1
                        E:=E+20
                        R:=R+1
                        Z:=E+11
                        X:=R+3
                        Pixelsearch, px, py, E, R, Z, X, 0x3D8ECF, 40, Fast 
                        if (ErrorLevel = 0){
                            Click, Down
                            clickup:=0
                        }
                    }else{
                        rite:=0
                        ImageSearch, T, Y, 0, 0, xreso, yreso, faceleft.png
                        if (ErrorLevel = 0){ 
                            lef:=1
                            Z:=T-41
                            X:=Y+1
                            C:=T+7
                            V:=Y+3
                            Pixelsearch, px, py, Z, X, C, V, 0x1A28DF, 55, Fast 
                            if (ErrorLevel = 0){
                                Click, Up
                                Sleep 50
                            }
                        }else{
                            lef:=0
                        }
                    }
                    ImageSearch, T, Y, 0, 0, xreso, yreso, maxed.png
                    if (ErrorLevel = 0){ 
                        maxed := 1
                        Click, Up
                        Sleep 1000
                    }else{
                        maxed := 0
                    }

                    ImageSearch, T, Y, 0, 0, xreso, yreso, green.png
                    if (ErrorLevel = 1){ 
                        Click, Up
                        Sleep 6200
                        SetMouseDelay, 200
                        Send {Esc down}
                        Sleep, 20
                        Send {Esc up}
                        Send {h down}
                        Sleep, 20
                        Send {h up}
                        Send {Tab down}
                        Sleep, 20
                        Send {Tab up}
                        Sleep 100
                        ImageSearch, T, Y, 0, 0, xreso, yreso, mobsname.png
                        if (ErrorLevel = 1){ 
                            ImageSearch, T, Y, 0, 0, xreso, yreso, attack.png
                            if (ErrorLevel = 0){ 
                                MouseClick, right, T, Y, 1
                            }
                            Sleep 100
                        }

                        break
                    }
                }
            }else{
                Send {Esc down}
                Sleep, 20
                Send {Esc up}
                break
            }
            break
        }
    }
}			
Return

F10::
Pause
Suspend
return