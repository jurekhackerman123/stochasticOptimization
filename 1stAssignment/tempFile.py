
points = [
    [3.0000116825, 0.5000029653],
    [3.0000307560, 0.5000077337],
    [2.9999875426, 0.4999970049],
    [3.0000498295, 0.5000125021],
    [2.9999717474, 0.4999922365],
    [2.9999708533, 0.4999922365],
    [3.0000307560, 0.5000077337],
    [3.0000307560, 0.5000077337],
    [2.9999613166, 0.4999898523],
    [3.0000155568, 0.5000038594]
]

def func(x): 
    g1 = ( 1.5 - x[0] + x[0] * x[1] )**2
    g2 = ( 2.25 - x[0] + x[0] * x[1]**2 )**2
    g3 = ( 2.625 - x[0] + x[0] * x[1]**3 )**2

    return g1 + g2 + g3; 


result = []

for i in range(len(points)):
    result.append(func(points[i]))

print(result)

print(func([3,0.5]))

