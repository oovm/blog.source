# for-loop

标签（空格分隔）： 未分类

---

在此输入正文




1980: Ada
for Counter in 1 .. 5 loop
   -- statements
end loop;

1968: Algol 68
Algol68 很类似现在的for语言了：

FOR i FROM 1 BY 2 TO 3 WHILE i≠4 DO ~ OD

```c
for (INITIALIZATION; CONDITION; AFTERTHOUGHT) 
{
    // Code for the for-loop's body goes here.
}
```

1972: C/C++

```c
for (;;) print("s")
```



```kt
for (i in 1..4) print(i)
for (i in 4 downTo 1) {
    print(i)
}
```

```cs
for (;;)
{
    Console.WriteLine("Hello world!");
}
```


```py
result = []
for item in item_list:
    new_item = do_something_with(item)
    result.append(item)
```


```py
result = [do_something_with(item) for item in item_list]
result = (do_something_with(item) for item in item_list)
```


```py
results = [
    (i, j)
    for i in range(10)
    for j in range(i)
]
```

在Python中，for循环可以与else一起使用，组成for...else循环，else 中的语句会在循环正常执行完之后执行。
像上图中的for循环就是正常执行完毕，所以会接着执行else语句中的代码块。什么是不正常执行完毕呢？就是for循环中用到了break语句，这个之后会讲到。

```py
for i in range(1, 100, 5):
    print(i)
else:
    print("end")
```


```s
def fib(x: 1) = 1
def fib(x: 2) = 1
def fib(x: int) = fib(x-1) + fib(x-2)
```

```s
def fib(x) = match x {
    1 => 1
    2 => 1
    _ => fib(x-1) + fib(x-2)
}
```

