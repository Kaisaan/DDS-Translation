#include <stdio.h>
#include <ctype.h>

int main(int argc, char* argv[]) {

    FILE* inputFile = fopen(argv[1], "r");

    int width = 32, height = 32;

    char tag[] = { 'B', 'M' };

    int header[] = {
        0xC22,              // File Size (34 + 32 * 32 * 3)
        0x00, 
        0x36,
        0x28,                // Header Size
        width, height,       // Image dimensions in pixels
        0x180001,            // 24 bits/pixel, 1 color plane
        0,                   // BI_RGB no compression
        0,                   // Pixel data size in bytes
        0x002e23, 0x002e23,  // Print resolution
        0, 0,                // No color palette
    };

    char outputFileName[100];
    snprintf(outputFileName, sizeof(outputFileName), "%s.bmp", argv[1]);
    FILE* outputFile = fopen(outputFileName, "wb");

    char bitmap[3072];

    char c;

    int i = 0;

    while ((c = fgetc(inputFile)) != EOF) {
            if (c == '.') {
                bitmap[i] = 0xFF;
                bitmap[i+1] = 0xFF;
                bitmap[i+2] = 0xFF;
                i += 3;
            } else if (c == 'x') {
                bitmap[i] = 0x00;
                bitmap[i+1] = 0x00;
                bitmap[i+2] = 0x00;
                i += 3;
            }
    }
    
    fwrite(&tag, sizeof(tag), 1, outputFile);
    fwrite(&header, sizeof(header), 1, outputFile); 
    fwrite(&bitmap, sizeof(bitmap), 1, outputFile);

    fclose(inputFile);
    fclose(outputFile);

    return 0;

}