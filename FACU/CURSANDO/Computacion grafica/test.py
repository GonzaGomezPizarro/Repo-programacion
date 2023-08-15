import gi 
gi.require_version ('Gtk','3.0')
from gi.repository import Gtk

class MainWindow(Gtk.Window):
    def __init__(self):
        super (MainWindow, self).__init__()
        self.connect("destroy", on_destroy)
        self.set_default_size(400,300)

        btn = Gtk.Button(label = 'Hola Todos')
        btn.connect("clicked", self.on_clicked)
        btn2 = Gtk.Button(label = 'Otro Hola Todos')
        btn2.connect("clicked", self.on_clicked)
        btn3 = Gtk.Button(label = '3er Hola Todos')
        btn3.connect("clicked", self.on_clicked)
        cbtn = Gtk.ColorButton()
        cbtn.connect("changed", self.on_color_chage)
        fcbtn = Gtk.FilechooserButton()

        self.bff = Gtk.TextBuffer()
        view = Gtk.TextView(buffer = self.bff)
        scroller = Gtk.ScrolledWindow()
        scroller.add(view)


        grid = Gtk.Grid(column_spacing = 4, row_spacing = 2) #Vbox - Hbox lo hace vertical
        grid.attach(btn, 0, 0, 1, 1)
        grid.attach(btn2, 0, 1, 1, 1)
        grid.attach(btn3, 1, 0, 1, 2) 
        grid.attach(cbtn, 2, 0, 1, 2)
        grid.attach(fcbtn, 0, 2, 3, 2)
        grid.attach(view, 0, 4, 6, 1)
        grid.attach(scroller, 0, 3, 3, 1)

        self.add(grid)
        self.show_all
        ()
    def on_destroy():
        Gtk.main_quit()

    def on_clicked(self, btn):
        print("clickeeeed")
    
    def on_color_change(self, cbtn):
        self.bff.set_text(str(cbtn.get_color()) + '\n')

    def run(self):
        Gtk.main()

def main(args):
    mainwdw = MainWindow()
    mainwdw.run()
    return 0

if __name__ == '__main__':
    sys.exit(main())