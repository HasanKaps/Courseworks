#include <stdio.h>
#include <stdlib.h>

//function to get struct ppm from a ppm file
struct PPM * getPPM(FILE * f);

//function to display ppm in the commandline from a struct
void showPPM(struct PPM * im);

//function to encode
struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret);

//function to decode
char * decode(struct PPM * im, unsigned int secret);




struct PPM
{
    int width;
    int height;
    int max;
    int values[];
};


int main(int args, char ** argv) {


    FILE *f;
    FILE *f2;

        
    f = fopen("test.ppm","r");
    f2 = fopen("test2.txt","w");

    struct PPM * ppm = getPPM(f);

    fclose(f);

    return 0;
}

struct PPM * getPPM(FILE * f)
{

    char charReader[255];
    int intReader;
    int endline;
    int width;
    int height;
    int i = 0;

    while (endline != -1)
    {

        endline = fscanf(f, "%s", charReader);
        if(strcmp(charReader,"#") == 0)
        {
            fgets(charReader, 255, f);
            continue;
        }
        printf("charreader : %s\n", charReader);
    
        int val = atoi(charReader);
        if(val != 0)
        {

            width = val;
            break;
        }
        
    }

    
    endline = fscanf(f, "%s", charReader);
    height = atoi(charReader);

    struct PPM * ppm = malloc(sizeof(struct PPM) + (width * height * 3) * sizeof(int)) ;
    
    endline = fscanf(f, "%s", charReader);
    ppm->width = width;
    ppm->height = height;
    ppm->max = atoi(charReader);

    
   
    while (i < (width * height * 3))
    {
        
        endline = fscanf(f, "%s", charReader);
        ppm->values[i] = atoi(charReader);
        i++;
    }

    return ppm;
}