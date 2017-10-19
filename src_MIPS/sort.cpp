void swap(int v[], int k){ // 交换v[k]与v[k+1]
    int temp;
    temp = v[k];
    v[k] = v[k+1];
    v[k+1] = temp;
}

void sort(int v[], int n){// 冒泡排序
    int i, j;
    for (i = 0; i < n; i++){
        for (j = i-1; j >= 0 && v[j] > v[j+1]; j++)
            swap(v,j);
    }
}

int i;
for (i = 0; i < n; i++){
    // 循环主体
}

    int i = 0; // 初始化变量部分
for_loop：
    //  判断条件部分
    if(i >= n) goto exit_loop;

    // 循环主体部分

    i = i + 1;// 循环变量+1
    goto for_loop;
exit_loop:

