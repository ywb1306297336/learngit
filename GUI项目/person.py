class Person:
    def __init__(self, name, age, job = None, pay = 0):
        self.name = name
        self.age = age
        self.job = job
        self.pay = pay
    def lastName(self):
        return self.name.split()[-1]
    def giveRaise(self, percent):
        self.pay *= (1.0 + percent)
    def __str__(self):
        return ('< %s => %s: %s %s >' % (self.__class__.__name__, self.name, self.job, self.pay))
class Manager(Person):
    def __init__(self, name, age, pay):
        Person.__init__(self, name, age, 'manager', pay)
    def giveRaise(self, percent, bonus = 0.1):
        Person.giveRaise(self, percent + bonus)
if __name__ == '__main__':
    bob = Person('Bob Simth', 42, 'software', 20000)
    sue = Person('Sue Jones', 45, 'hardware', 30000)
    tom = Manager('Tom Doe', 50, 50000)
    print(tom.lastName())
    db = [bob, sue, tom]
    for obj in db:
        obj.giveRaise(.20)
        print(obj)
