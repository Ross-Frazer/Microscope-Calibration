function i = ybarcount(x,plainbars)
%barcount counts the number of bars in the image in the vertical y
%direction
y=1;
barcurrent=false;
barlast=false;
i=0;

for y = drange(1:576)
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
if plainbars(576,x)==1
    i=i+1;
end
