A = imread('C:\Users\MATLAB Club\Desktop\mnist4.png');
B = imread('C:\Users\MATLAB Club\Desktop\mnist4.png');
for n = 1:28
    string = '';
    for m = 1:28
        A(n,m) = 255-A(n,m);
        %if A(n,m) < 100 && A(n,m) > 9
        %    string = strcat(string,'0')
        %    string = strcat(string,int2str(A(n,m)));    
        %    string = strcat(string,',');
        %end
        %if A(n,m) < 100 && A(n,m) < 9
        %    string = strcat(string,'00')
        %    string = strcat(string,int2str(A(n,m)));    
        %    string = strcat(string,',');
        %end
        %if A(n,m) > 99
            string = strcat(string,int2str(A(n,m)));    
            string = strcat(string,',');
        %end
    end
    disp(string)
    string = '';
end
%imshow(A);