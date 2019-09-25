function i = xbarcount(y, plainbars)
%barcount counts the number of bars in the image in the horizontal x
%direction
x=1;
barcurrent=false;
barlast=false;
i=0;

for x = drange(1:768)
    if plainbars(y,x)==1
        barlast=barcurrent;
        barcurrent=true;
        if barcurrent==false && barlast==true
            i=i+1;
        end
    else
        barlast=barcurrent;
        barcurrent=false;
        if barcurrent==false && barlast==true
            i=i+1;
        end
    end
end
if plainbars(y,768)==1
    i=i+1;
end

