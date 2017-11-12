assume cs:code, ds:data

data segment
    table dw ag0, ag30, ag60,ag90, ag120, ag150, ag180
    ag0   db '000',0
    ag30   db '001',0
    ag60   db '002',0
    ag90   db '003',0
    ag120   db '004',0
    ag150   db '005',0
    ag180   db '006',0
data ends

code segment
start:



code ends
end start