%==============================================================
%You can test this by using T2.m
%Note: if you make changes here you have to save them before
%      running the test script.
%Note: Function name must equal file name or you will get an error
%==============================================================
function [Imageout] = ChangeColor (ImageIn, ZipCode, NewColor)

    %Identify Zipcode Color to replace
    zipcodeColor = xlsread("RIZipCodeColorData.xlsx","Sheet1");
    
    %find Zipcode Color from Input Zipcode
    zipfound = false;
    count = 1;
    [zipct,~] = size(zipcodeColor);
    while zipfound == false && count <= zipct
        if ZipCode == zipcodeColor(count)
           zipfound = true;
        else
           count = count + 1;
        end
    end
   
    %Get Size of image 3rd demention is 3 (RGB)
    [x,y,~]=size(ImageIn);
   
    %Change Zipcode Pixal Color to new color
    if zipfound == true
        for ii=1:x
           for jj=1:y
               if ImageIn(ii,jj,1) == zipcodeColor(count,2) && ImageIn(ii,jj,2) == zipcodeColor(count,3) && ImageIn(ii,jj,3) == zipcodeColor(count,4) 
                   ImageIn(ii,jj,1) = NewColor(1);
                   ImageIn(ii,jj,2) = NewColor(2);
                   ImageIn(ii,jj,3) = NewColor(3);
                end
            end
        end
    end
    Imageout = ImageIn;
end
