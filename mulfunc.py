#递归阶乘
def mulfunc(x):
    return x if x == 1 else x * mulfunc(x-1)
