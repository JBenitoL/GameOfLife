//Traductor visual de decimal a binario

//Autores: Jorgix del Pechix y Pepsis Benitix
//Fecha  : 17/09/2016


//Este programa traduce de decimal a binario de manera visual encendiendo leds.
//La primera parte del programa trasnforma el numero decimal introducido por el 
//usuario a binario. Después, enciende los leds correspondientes a los 1s.


//Incluyo libreria de mates
#include <math.h>


//Defino la string que el usuario va a introducir
String incomingByte = "111";   // for incoming serial 

void setup() {
        Serial.begin(9600);     // opens serial port, sets data rate to 9600 bps
        pinMode(13,OUTPUT);
        pinMode(2,OUTPUT);
        pinMode(3,OUTPUT);
        pinMode(4,OUTPUT);
        pinMode(5,OUTPUT);
        pinMode(6,OUTPUT);
}


void loop() {

        // send data only when you receive data:
        if (Serial.available() > 0) {
                //Lee la string
                incomingByte = Serial.readString();
                //Pasamos la string a entero para poder llamar la función
                int numero = incomingByte.toInt();
                //Calculamos el numero máximo de bits del numero
                int nBits = log(numero)/log(2) + 1;
                //Ponemos todo a cero para que no haya problemas
                for (int i = 2; i<7;i++){
                  digitalWrite(i,LOW);
                
                }
                //Vamos a empezar un bucle comenzando por el led menos significativo hasta el más.
                for (int i = 0; i<nBits; i++){
                  //Llamamos a la funcion que nos da elemento en la posicion de i del numero binario
                  int Binary = Decima2Binary (numero,i );
                  //Ploteamos para ver si esta correcto
                  Serial.println(Binary);
                 //Si es un 1 se deberá encender y además escribe ON y si no se apaga y escribe OFF
                  if (Binary == 1){
                    
                      digitalWrite(i + 3,HIGH);
                      Serial.println("ON");
                  }
                  else {
                      digitalWrite(i + 3,LOW);
                      Serial.println("OFF");
                  }
                 }
                //Para terminar el bucle
                Serial.println("Fin");
                
        }
        
}

//Funcion que pasa de decimal a binario y te devuelve el elemento del vector necesario.
int Decima2Binary (int numero, int Bit ){
  
  int cociente (1);
  int n(0);
  int nBits = log(numero)/log(2) + 1;
  int bits[nBits];
 //Divide el cociente hasta que sea cero y se queda con el resto para guardarlo en el vector de bits
  while (cociente!=0){

    cociente = numero / 2;
    bits[n] = numero % 2;
    numero = cociente;
    n++;

  }
  //Devuelve el elemento del vector que se vaya necesitando según el bucle
  return bits[Bit];
}
