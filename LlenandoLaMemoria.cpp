#include <iostream>
using namespace std;

inline void llenando (float &contador){
    int a;
    contador++;
    if (contador < 43339){ //43339
        llenando(contador);
    }
    return;


}

int main(){
    float c=0;
    llenando(c);

    cout << c;
    return 0;
}
