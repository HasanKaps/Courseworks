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
    int Num[];
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

//convert string to Binary

char * StringtoBinary(char* s);

//gets pixels

int getPixel(int Prime, int i, int photoSize);

int change(int num);

//get primenums

int getPrime(int num);

int isPrime(int prime);

//Binary to string

char* BinarytoString (char * bin);

//create ppm

void createPPM(struct PPM * ppm, char * nameFile);

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

    char charReader[255];
    int intReader;
    char LetterCode[2];
    int End;
    int Width;
    int Height;
    int i = 0;

    //get letter code
    
    End = fscanf(f, "%s", LetterCode);

    //Remove comments
    
    while (End != -1)
    {

        End = fscanf(f, "%s", charReader);
        if(strcmp(charReader,"#") == 0)
        {
            fgets(charReader, 255, f);
            continue;
        }else{

            int val = atoi(charReader);
            Width = val;
            break;
        }
        
    }

    //get Height
    End = fscanf(f, "%s", charReader);
    Height = atoi(charReader);

    //create struct to store ppm

    struct PPM * ppm = malloc(sizeof(struct PPM) + (Width * Height * 3) * sizeof(int)) ;
    
    //get the max value
    
    End = fscanf(f, "%s", charReader);

    // copy every value to the ppm

    strcpy(ppm->LetterCode,LetterCode);
    ppm->Width = Width;
    ppm->Height = Height;
    ppm->max = atoi(charReader);

    
   
    while (i < (Width * Height * 3))
    {
        
        End = fscanf(f, "%s", charReader);
        ppm->Num[i] = atoi(charReader);
        i++;
    }

    return ppm;
}

void showPPM(struct PPM * im)
{}

struct PPM * encode (struct PPM * im, char * message, unsigned int mSize, unsigned int secret)
{
    int i;
    struct PPM * ppm = im;

    createPPM(im, "im.ppm");

    int photoSize = im->Width * im->Height;
    int Prime = getPrime((secret % photoSize)/10);
    char * Binary = StringtoBinary(message);

    for(i = 0; i < (((mSize /3)* 8) + 3); i++)

    {

        int pixel = getPixel(secret, i, photoSize);
        int R = ppm->Num[pixel * 3];
        int G = ppm-> Num[pixel * 3 + 2];
        int B = ppm->Num[pixel * 3 + 1];

        if(R % 2 != (Binary[i*3] - '0'))
        {
            R = change(R);
        }
        
        if(G % 2 != (Binary[i*3 + 2]- '0'))
        {
            G = change(G);
        }
        
        if(B % 2 != (Binary[i*3 + 1] - '0'))
        {
            B = change(B);
        }

        ppm->Num[pixel * 3] = R;
        ppm->Num[pixel * 3 + 2] = G;
        ppm->Num[pixel * 3 + 1] = B;

    }

    int count =17;

    while(count > 1)
    {
        int pixel = getPixel(secret, i, photoSize);
        int R = ppm->Num[pixel * 3];
        int G = ppm-> Num[pixel * 3 + 2];
        int B = ppm->Num[pixel * 3 + 1];

        if(R % 2 != 0)
        {
            R--;
        }
        
        if(G % 2 != 0)
        {
            G--;
        }
        
        if(B % 2 != 0)
        {
            B--;
        }

        ppm->Num[pixel * 3] = R;
        ppm->Num[pixel * 3 + 2] = G;
        ppm->Num[pixel * 3 + 1] = B;
        i++;
        count--;
    }

    return ppm;



}


char * decode(struct PPM * im, unsigned int secret)
{
    int i = 0;
    struct PPM * ppm = im;
    int photoSize = im->Width * im->Height;
    int Prime = getPrime((secret % photoSize));
    char * Binary = malloc(500 * 8);
    int Zero = 0;

    while(Zero < 45)
    {

        int pixel = getPixel(secret, i, photoSize);
        int R = ppm->Num[pixel * 3];
        int G = ppm-> Num[pixel * 3 + 2];
        int B = ppm->Num[pixel * 3 + 1];
        

        if(R % 2 != 0)
        {
            Binary[i*3] = '1';
            Zero = 0;
        }
       
        else
       
        {
            Binary[i*3] = '0';
            Zero++;
        }

        if(B % 2 != 0)
        {
            Binary[i*3 + 1] = '1';
            Zero = 0;
        }
        
        else
        
        {
            Binary[i*3 + 1] = '0';
            Zero++;
        }

        if(G % 2 != 0)
        {
            Binary[i*3 + 2] = '1';
            Zero = 0;
        }
        
        else
        
        {
            Binary[i*3 + 2] = '0';
            Zero++;
        }

        ppm->Num[pixel * 3] = R;
        ppm->Num[pixel * 3 + 2] = G;
        ppm->Num[pixel * 3 + 1] = B;
        i++;
    }

    
    char * res;
    memcpy(res, &Binary[0], strlen(Binary)-46);
    return BinarytoString(res);

}



char * StringtoBinary(char* s) {
   
    if(s == NULL) {
   
        return 0; 
   
    }

    int len = (int)strlen(s);
    char * Binary = malloc(len * 8 + 1); // each char is one byte (8 bits) and + 1 at the end for null terminator
    Binary[0] = '\0';

    for(size_t i = 0; i < len; ++i) {

        char ch = s[i];

        for(int j = 7; j >= 0; --j){

            if(ch & (1 << j)) {
                strcat(Binary,"1");
            } else {
                strcat(Binary,"0");
            }
        }
    }
    
    return Binary;

}

char* BinarytoString (char * bin)
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

int getPixel(int Prime, int i, int photoSize){

    int pixel;

    pixel = (Prime * i) % photoSize;

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
   
    }
    
    else{
    
        return (num - 1);
    
    }
    
}

int getPrime(int num)
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

    fprintf(f, "%s\n", ppm->LetterCode);
    fprintf(f, "%d %d\n", ppm->Width, ppm->Height);
    fprintf(f, "%d\n", ppm->max);

    int size = ppm->Width * ppm ->Height * 3;

    for(int i = 0; i< size; i++)
    {
        fprintf(f, "%d\n", ppm->Num[i]);
    }

    fclose(f);

}