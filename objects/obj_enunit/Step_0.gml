
highlight=0;
var diff,siz,pos;
diff=0;pos=880;siz=min(400,(men*0.5)+(medi)+(veh*2.5)+(dreads*2));
if (instance_exists(obj_centerline)){
    diff=x-obj_centerline.x;
}
if (siz>0){
    if ((pos+(diff*2))>817) and ((pos+(diff*2))<1575){
        if (mouse_x>=pos+(diff*2)) and (mouse_y>=450-(siz/2)) 
        and (mouse_x<pos+(diff*2)+10) and (mouse_y<450+(siz/2)) then highlight=men+medi+veh;
    }
}

if (highlight2!=highlight){
    highlight2=highlight;highlight3="";
    
    if (obj_ncombat.enemy!=1){
        var i,stop;i=0;stop=0;
        repeat(70){i+=1;
            if (stop=0){
                if (dudes_num[i]>0) and (dudes_num[i+1]>0) then highlight3+=string(dudes_num[i])+"x "+string(dudes[i])+", ";
                if (dudes_num[i]>0) and (dudes_num[i+1]<=0){highlight3+=string(dudes_num[i])+"x "+string(dudes[i])+".  ";stop=1;}
            }
        }
    }
    
    if (obj_ncombat.enemy=1){
        var variety,variety_num,i,q,stop,sofar,compl,vas;
        i=-1;q=0;stop=0;variety=0;variety_num=0;sofar=0;compl="";vas="";
        
        q=-1;repeat(800){q+=1;variety[q]="";variety_num[q]=0;}
        q=0;repeat(700){q+=1;
            if (dudes[q]!="") and (string_count(string(dudes[q])+"|",compl)=0){
                compl+=string(dudes[q])+"|";sofar+=1;
                variety[sofar]=dudes[q];
                variety_num[sofar]=0;
            }
        }
        q=0;repeat(700){q+=1;
            if (dudes[q]!=""){i=0;
                repeat(50){i+=1;
                    if (dudes[q]=variety[i]) then variety_num[i]+=dudes_num[q];
                }
            }
            
        }
        i=0;stop=0;
        repeat(70){i+=1;
            if (stop=0){
                if (variety_num[i]>0) and (variety_num[i+1]>0) then highlight3+=string(variety_num[i])+"x "+string(variety[i])+", ";
                if (variety_num[i]>0) and (variety_num[i+1]<=0){highlight3+=string(variety_num[i])+"x "+string(variety[i])+".  ";stop=1;}
            }
        }
    }
    
    
}


