#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Structs to hold PPM images`
struct PPM {

    char LetterCode[2];
    int Width;
    int Height;
    int Max;
    int Num[];

};

//functions

//return C structure PPM image from file 

struct PPM * getPPM(FILE * f);

//display the PPM image “im” as text

void showPPM(struct PPM * im);

//encode
struct PPM * encode(struct PPM * im, char * message, unsigned int mSize, unsigned int secret);

//decode
char * decode(struct PPM * im, unsigned int secret);

//get pixels
    
int GetPixels(FILE * f);

//main function
int main(int argc, char ** argv[]) {


}
