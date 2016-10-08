A = imread('C:\Users\MATLAB Club\Desktop\mnist4.png');
B = imread('C:\Users\MATLAB Club\Desktop\mnist4.png');
for n = 1:28
    string = '';
    for m = 1:28
        A(n,m) = 255-A(n,m); % invert the pixel at mth column of the nth row
        string = strcat(string,int2str(A(n,m))); % convert the integer at that position from an integer to a character array and then concatenate the value to the character array "string"  
        string = strcat(string,','); % add a comma delimiter to seperate "pixels"
    end
    disp(string)
    string = '';
end
imshow(A); 