#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//structs 

struct PPM
{
    char LetterCode[2];
    int Width;
    int Height;
    int max;
    int Val[];
    struct values * value;
};

struct values
{

    int R;
    int G;
    int B;

};      

//functions

//return a C structure PPM image from file “f”

struct PPM * getPPM(FILE * f);

//display the PPM image “im” as text

void showPPM(struct PPM * im);

//encode

struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret);

//decode

char * decode(struct PPM * im, unsigned int secret);

//main function

int main(int args, char ** argv) {


    FILE *f;
    FILE *f2;

        
    f = fopen("star.ppm","r");

    struct PPM * ppm = getPPM(f);

    struct PPM * encodedPPM = encode(ppm, "HSI", strlen("HSI"), 2560867);

    char * message = decode(encodedPPM, 2560867);

    printf("\n%s\n", message);
   
    fclose(f);
    
    return 0;
}
struct PPM * getPPM(FILE * f)
{

}

void showPPM(struct PPM * im)
{
    

    printf("%s\n", im->LetterCode);
    printf("%d %d\n%d\n", im->Width, im->Height, im->max);

    int size = im->Width * im->Height * 3;

    int i = 0;
    
    while(i < size)
    {
        printf("%d %d %d\n", im->Val
        [i], im->Val
        [i+1], im->Val
        [i+2]);
        i+=3;
    }
}

//encode refrenced from github https://github.com/nyalsadiq/Steganography/blob/master/F28HS.c
struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret)
{

int i,j,start;
	int counter = 0;
	time_t t;
	srand((unsigned) time(&t));

	start = rand() % (im->Height*im->Width/ 2);

	for(i = start; i < (im->Height*im->Width); i++){
		
			if (counter < strlen(message)){
				
				im->value[i].R = message[counter];
				counter = counter + 1;
            }
			
            if(counter < strlen(message)) {
                
                im->value[i].G = message[counter];
				counter = counter + 1;
            }
            
            if(counter < strlen(message)) {
                
                im->value[i].B = message[counter];
				counter = counter + 1;
            }		

			else{
				
				return im;
				
			}
		
	}	
	return im;

}


char * decode(struct PPM * im, unsigned int secret)
{
    
}

