from tkinter import *
from tkinter import ttk
from tkinter.messagebox import showerror
import shelve
shelvename = 'class-shelve'
fieldnames = ('name', 'age', 'job', 'pay')
def makeWidgets():
    global entries
    window = Tk()
    window.title('People Shelve')
    btntextstyle = 'blue.TButton'
    ttk.Style().configure(btntextstyle, foreground = 'blue')
    form = Frame(window)
    form.pack()
    entries = {}
    for (ix, label) in enumerate(('key',) + fieldnames):
        lab = Label(form, text = label)
        ent = Entry(form)
        lab.grid(row = ix, column = 0)
        ent.grid(row = ix, column = 1)
        entries[label] = ent
    ttk.Button(window, text = 'Fetch', style = btntextstyle, command = fetchRecord).pack(side = LEFT)
    ttk.Button(window, text = 'Update', style = btntextstyle, command = updateRecord).pack(side = LEFT)
    ttk.Button(window, text = 'Quit', style = btntextstyle, command = window.quit).pack(side = RIGHT)
    return window
def fetchRecord():
    key = entries['key'].get()
    try:
        record = db[key]
    except:
        showerror(title = 'Error', message = 'No such key!')
    else:
        for field in fieldnames:
            entries[field].delete(0, END)
            entries[field].insert(0, repr(getattr(record, field)))
def updateRecord():
    key = entries['key'].get()
    if key in db:
        record = db[key]
    else:
        from person import Person
        record = Person(name = '?', age = '?')
    for field in fieldnames:
        setattr(record, field, eval(entries[field].get()))
    db[key] = record
db = shelve.open(shelvename)
window = makeWidgets()
window.mainloop()
db.close()
