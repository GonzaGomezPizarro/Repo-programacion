#include <iostream>
using namespace std;

float control (float entrada){
    static float h1 = 0, h2 = 0, h3 = 0;
    float h;
    float y;

    h = entrada + h1 - 3 + h3 - 5;

    y = h1*3 + h2*2 + h3*6;

    h3 = h2;
    h2 = h1;
    h1 = h;

    return y;
}

int main (){
    
    return 0;
}