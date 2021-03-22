s = 'Hello world!'
def sayHello(x):
    for i in range(10):
        print(i * '\t' + s, end = '\n')
if __name__ == '__main__':
    sayHello(s)
