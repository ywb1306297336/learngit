#容器类
class Restaurant:
    def __init__(self):
        self.cust = Customer()
        self.empl = Employee()
    def order(self, foodName):
        self.cust.placeOrder(foodName, self.empl)
    def result(self):
        self.cust.printFood()
#顾客类
class Customer:
    def __init__(self):
        self.food = None
    def placeOrder(self, foodName, employee):
        self.food = employee.takeOrder(foodName)
    def printFood(self):
        print(self.food.name)
#雇员类
class Employee:
    def takeOrder(self, foodName):
        return Food(foodName)
#食物类
class Food:
    def __init__(self, name):
        self.name = name
