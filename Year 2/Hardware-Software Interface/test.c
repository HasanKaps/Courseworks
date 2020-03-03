#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//function to get struct ppm from a ppm file
struct PPM * getPPM(FILE * f);

//function to display ppm in the commandline from a struct
void showPPM(struct PPM * im);

//function to encode
struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret);

//function to decode
char * decode(struct PPM * im, unsigned int secret);

//function to convert string to binary
char * strToBin(char* s);

//Function to gets pixel
int getPixel(int primeNumber, int i, int photoSize);

int change(int num);

//
int getPrimeNumber(int num);

int isPrime(int prime);

char* binToStr (char * bin);

void createPPM(struct PPM * ppm, char * nameFile);

struct PPM
{
    char letterCode[2];
    int width;
    int height;
    int max;
    int values[];
};


int main(int args, char ** argv) {


    FILE *f;
    FILE *f2;

        
    f = fopen("star.ppm","r");

    struct PPM * ppm = getPPM(f);

    struct PPM * encodedPPM = encode(ppm, "Hello, MY name is gada", strlen("Hello, MY name is gada"), 245678);

    char * message = decode(encodedPPM, 245678);


    printf("\n%s\n", message);

    createPPM(encodedPPM, "newppm.ppm");

   

    fclose(f);

    return 0;
}

struct PPM * getPPM(FILE * f)
{

    char charReader[255];
    int intReader;
    char letterCode[2];
    int endline;
    int width;
    int height;
    int i = 0;

    //get the letter code
    endline = fscanf(f, "%s", letterCode);

    //get rid of the comments
    //untill width is scanned
    while (endline != -1)
    {

        endline = fscanf(f, "%s", charReader);
        if(strcmp(charReader,"#") == 0)
        {
            fgets(charReader, 255, f);
            continue;
        }else{

            int val = atoi(charReader);
            width = val;
            break;
        }
        
    }

    //get the height
    endline = fscanf(f, "%s", charReader);
    height = atoi(charReader);

    //create new struct ppm to store the image
    struct PPM * ppm = malloc(sizeof(struct PPM) + (width * height * 3) * sizeof(int)) ;
    
    //get the max value
    endline = fscanf(f, "%s", charReader);

    // coppy every value to the ppm
    strcpy(ppm->letterCode,letterCode);
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

void showPPM(struct PPM * im)
{



}

struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret)
{
    int i;
    struct PPM * ppm = im;

    createPPM(im, "im.ppm");
    int photoSize = im->width * im->height;
    int primeNumber = getPrimeNumber((secret % photoSize)/10);
    char * binary = strToBin(message);

    for(i = 0; i < (((mSize /3)* 8) + 3); i++)
    {

        int pixel = getPixel(secret, i, photoSize);
        int red = ppm->values[pixel * 3];
        int blue = ppm->values[pixel * 3 + 1];
        int green = ppm-> values[pixel * 3 + 2];

        if(red % 2 != (binary[i*3] - '0'))
        {
            red = change(red);
        }
        if(blue % 2 != (binary[i*3 + 1] - '0'))
        {
            blue = change(blue);
        }
        if(green % 2 != (binary[i*3 + 2]- '0'))
        {
            green = change(green);
        }

        ppm->values[pixel * 3] = red;
        ppm->values[pixel * 3 + 1] = blue;
        ppm->values[pixel * 3 + 2] = green;

    }



    int count =17;

    while(count > 1)
    {
        int pixel = getPixel(secret, i, photoSize);
        int red = ppm->values[pixel * 3];
        int blue = ppm->values[pixel * 3 + 1];
        int green = ppm-> values[pixel * 3 + 2];

        if(red % 2 != 0)
        {
            red--;
        }
        if(blue % 2 != 0)
        {
            blue--;
        }
        if(green % 2 != 0)
        {
            green--;
        }


        ppm->values[pixel * 3] = red;
        ppm->values[pixel * 3 + 1] = blue;
        ppm->values[pixel * 3 + 2] = green;

        i++;
        count--;
    }

    return ppm;



}


char * decode(struct PPM * im, unsigned int secret)
{
    int i = 0;
    struct PPM * ppm = im;
    int photoSize = im->width * im->height;
    int primeNumber = getPrimeNumber((secret % photoSize));
    char * binary = malloc(500 * 8);
    int lastZero = 0;

    while(lastZero < 45)
    {

        int pixel = getPixel(secret, i, photoSize);
        int red = ppm->values[pixel * 3];
        int blue = ppm->values[pixel * 3 + 1];
        int green = ppm-> values[pixel * 3 + 2];

        if(red % 2 != 0)
        {
            binary[i*3] = '1';
            lastZero = 0;
        }else
        {
            binary[i*3] = '0';
            lastZero++;
        }

        if(blue % 2 != 0)
        {
            binary[i*3 + 1] = '1';
            lastZero = 0;
        }else
        {
            binary[i*3 + 1] = '0';
            lastZero++;
        }

        if(green % 2 != 0)
        {
            binary[i*3 + 2] = '1';
            lastZero = 0;
        }else
        {
            binary[i*3 + 2] = '0';
            lastZero++;
        }
        //printf("lastzero: %d\n", lastZero);



        ppm->values[pixel * 3] = red;
        ppm->values[pixel * 3 + 1] = blue;
        ppm->values[pixel * 3 + 2] = green;

        i++;
    }

    
    char * res;
    memcpy(res, &binary[0], strlen(binary)-45);

    printf("\nbinary decoded: %s\n" , res);  



    return binToStr(res);

}



char * strToBin(char* s) {
    if(s == NULL) {
        return 0; 
    }

    int len = (int)strlen(s);
    char * binary = malloc(len * 8 + 1); // each char is one byte (8 bits) and + 1 at the end for null terminator
    binary[0] = '\0';

    for(size_t i = 0; i < len; ++i) {

        char ch = s[i];

        for(int j = 7; j >= 0; --j){

            if(ch & (1 << j)) {
                strcat(binary,"1");
            } else {
                strcat(binary,"0");
            }
        }
    }
    return binary;
}

char* binToStr (char * bin)
{
    int len = (int)strlen(bin) - 1;
    char * message = malloc(len /8);

    for(int i =0; i< len; i += 8)
    {
        char subBin[9];
        memcpy(subBin, &bin[i], 8);
        subBin[9] = '\0';
        char character = strtol(subBin, NULL, 2);
        strncat(message, &character,1);
    }

    return message;
}

int getPixel(int primeNumber, int i, int photoSize){

    int pixel;

    pixel = (primeNumber * i) % photoSize;

    if(pixel < 0)
    {
        pixel *= -1;
    }

    return pixel;

}

int change(int num)
{
    if(num % 2 == 0)
    {
        return (num + 1);
    }else{
        return (num - 1);
    }
    
}

int getPrimeNumber(int num)
{
    num= num/100;
    num += 100 ;
    int prime = (num * 2) + 1;

    while(!isPrime(prime))
    {
        prime +=2;
    }

    return prime;
}

int isPrime(int prime){

    for (int i = 3; (i * i) <= prime; i+=2){
        if(prime % i == 0)
        {
            return 0;
        }
    }

    return 1;
}

void createPPM(struct PPM * ppm, char * nameFile)
{

    FILE *f;

    f = fopen(nameFile, "w");

    fprintf(f, "%s\n", ppm->letterCode);
    fprintf(f, "%d %d\n", ppm->width, ppm->height);
    fprintf(f, "%d\n", ppm->max);

    int size = ppm->width * ppm ->height * 3;

    for(int i = 0; i< size; i++)
    {
        fprintf(f, "%d\n", ppm->values[i]);
    }

    fclose(f);

}