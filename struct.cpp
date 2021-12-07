#include <iostream>
using namespace std;

struct Auto {
private:
    int velocidad;
public:

    static int contador;
    Auto (int v = 0){
        velocidad = v;
        contador ++;
    }
    ~Auto (){
        contador--;
    }
    int getVel(){
        return velocidad;
    }
    bool prendido = false;
    void encender (){
        prendido = true;
    }
};

int Auto :: contador = 0;

int main(){

    Auto* automovil, a;
    automovil = new Auto(999);


    cout << endl << automovil->contador <<endl;
    cout << automovil->getVel() << " " <<automovil->prendido <<endl;
    automovil->encender();

    cout << endl << automovil->prendido;

    delete automovil;

    cout << endl << a.contador <<endl;
}
