--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.7) ~  Much Love, Ferib 

]]--

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v82=v2(v0(v30,16));if v19 then local v89=v5(v82,v19);v19=nil;return v89;else return v82;end end end);local function v20(v31,v32,v33) if v33 then local v83=(v31/((1 + 0 + 1)^(v32-(2 -1))))%((5 -3)^(((v33-(1638 -(338 + 1185 + 114))) -(v32-(1 -0))) + (2 -1))) ;return v83-(v83%(1 + 0)) ;else local v84=619 -(555 + 64) ;local v85;while true do if (v84==(0 -(957 -(892 + 65)))) then v85=(933 -(857 + 74))^(v32-(569 -(367 + 201))) ;return (((v31%(v85 + v85))>=v85) and (928 -(214 + 713))) or (117 -(32 + 85)) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (4 -2) );v18=v18 + (3 -1) ;return (v36 * (469 -213)) + v35 ;end local function v23() local v37=350 -(87 + 263) ;local v38;local v39;local v40;local v41;while true do if (v37==((328 -147) -(67 + 113))) then return (v41 * (12302277 + 3257259 + 1217680)) + (v40 * 65536) + (v39 * (628 -372)) + v38 ;end if (v37==(0 + 0)) then v38,v39,v40,v41=v1(v16,v18,v18 + (11 -8) );v18=v18 + (956 -(802 + 150)) ;v37=2 -1 ;end end end local function v24() local v42=997 -(915 + 82) ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(2 -1)) then v45=(1748 -(760 + 987)) + 0 ;v46=(v20(v44,(1914 -(1789 + 124)) -0 ,1207 -(1069 + (884 -(745 + 21))) ) * ((8 -6)^(72 -40))) + v43 ;v42=(2 + 1) -1 ;end if (v42==(1 + 2)) then if (v47==(0 -0)) then if (v46==0) then return v48 * (0 -0) ;else v47=2 -1 ;v45=0 + 0 ;end elseif (v47==(2838 -(368 + 423))) then return ((v46==(885 -(261 + 624))) and (v48 * (1/(0 -0)))) or (v48 * NaN) ;end return v8(v48,v47-(1817 -794) ) * (v45 + (v46/(2^(70 -(10 + 8))))) ;end if (v42==(0 -0)) then v43=v23();v44=v23();v42=443 -(416 + (71 -45)) ;end if (v42==(6 -4)) then v47=v20(v44,10 + 11 ,54 -23 );v48=((v20(v44,470 -(145 + 293) )==(431 -(44 + 386))) and  -(3 -2)) or (1487 -((3914 -2916) + 488)) ;v42=3;end end end local function v25(v49) local v50;if  not v49 then v49=v23();if (v49==0) then return "";end end v50=v3(v16,v18,(v18 + v49) -(1 + 0) );v18=v18 + v49 ;local v51={};for v65=1 + 0 , #v50 do v51[v65]=v2(v1(v3(v50,v65,v65)));end return v6(v51);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return 0 + 0 ;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();while true do local v67=(function() return 0;end)();while true do if (v67==0) then if ((1690 -(209 + 1481))~=v52) then else local v94=(function() return 0;end)();local v95=(function() return;end)();while true do if (v94==(0 -0)) then v95=(function() return 0;end)();while true do if (v95==2) then v52=(function() return  #"]";end)();break;end if (v95==(1636 -(1373 + 263))) then v53=(function() return {};end)();v54=(function() return {};end)();v95=(function() return 1;end)();end if (v95==1) then v55=(function() return {};end)();v56=(function() return {v53,v54,nil,v55};end)();v95=(function() return 1 + 1 ;end)();end end break;end end end if (v52== #"[") then local v96=(function() return 0;end)();while true do if (v96~=(0 -0)) then else v57=(function() return v23();end)();v58=(function() return {};end)();v96=(function() return 1;end)();end if (v96==1) then for v111= #"{",v57 do local v112=(function() return 0 -0 ;end)();local v113=(function() return;end)();local v114=(function() return;end)();local v115=(function() return;end)();while true do if (0==v112) then local v142=(function() return 1384 -(746 + 638) ;end)();while true do if (v142==(1 + 0)) then v112=(function() return 1 -0 ;end)();break;end if (v142~=(341 -(218 + 123))) then else v113=(function() return 0;end)();v114=(function() return nil;end)();v142=(function() return 1;end)();end end end if (v112~=1) then else v115=(function() return nil;end)();while true do if ( #"{"==v113) then if (v114== #",") then v115=(function() return v21()~=0 ;end)();elseif (v114==2) then v115=(function() return v24();end)();elseif (v114~= #"nil") then else v115=(function() return v25();end)();end v58[v111]=(function() return v115;end)();break;end if (v113==(1581 -(1535 + 46))) then local v156=(function() return 0 + 0 ;end)();while true do if (v156==1) then v113=(function() return  #"}";end)();break;end if (0~=v156) then else v114=(function() return v21();end)();v115=(function() return nil;end)();v156=(function() return 1 + 0 ;end)();end end end end break;end end end v56[ #"xnx"]=(function() return v21();end)();v96=(function() return 562 -(306 + 254) ;end)();end if (v96==2) then v52=(function() return 2;end)();break;end end end v67=(function() return 1 + 0 ;end)();end if (v67==(1 -0)) then if (2==v52) then for v97= #"~",v23() do local v98=(function() return 1467 -(899 + 568) ;end)();local v99=(function() return;end)();local v100=(function() return;end)();while true do if (v98==(1 + 0)) then while true do if (v99==(0 -0)) then v100=(function() return v21();end)();if (v20(v100, #" ", #":")==0) then local v151=(function() return 0;end)();local v152=(function() return;end)();local v153=(function() return;end)();local v154=(function() return;end)();while true do if (v151==1) then v154=(function() return {v22(),v22(),nil,nil};end)();if (v152==0) then local v161=(function() return 290 -(60 + 230) ;end)();local v162=(function() return;end)();while true do if (v161==(572 -(426 + 146))) then v162=(function() return 0;end)();while true do if (v162~=(0 + 0)) then else v154[ #"19("]=(function() return v22();end)();v154[ #"http"]=(function() return v22();end)();break;end end break;end end elseif (v152== #"}") then v154[ #"-19"]=(function() return v23();end)();elseif (v152==(1458 -(282 + 1174))) then v154[ #"gha"]=(function() return v23() -((813 -(569 + 242))^16) ;end)();elseif (v152~= #"asd") then else local v171=(function() return 0 -0 ;end)();local v172=(function() return;end)();while true do if (v171~=0) then else v172=(function() return 0;end)();while true do if (v172==0) then v154[ #"xnx"]=(function() return v23() -((1 + 1)^(1040 -(706 + 318))) ;end)();v154[ #"asd1"]=(function() return v22();end)();break;end end break;end end end v151=(function() return 2;end)();end if (v151~=(1251 -(721 + 530))) then else local v159=(function() return 0;end)();while true do if (1==v159) then v151=(function() return 1;end)();break;end if (v159~=0) then else local v166=(function() return 0;end)();while true do if (1==v166) then v159=(function() return 1272 -(945 + 326) ;end)();break;end if (v166==0) then v152=(function() return v20(v100,4 -2 , #"91(");end)();v153=(function() return v20(v100, #".dev",6 + 0 );end)();v166=(function() return 701 -(271 + 429) ;end)();end end end end end if (2~=v151) then else if (v20(v153, #"[", #"{")~= #"/") then else v154[2 + 0 ]=(function() return v58[v154[2]];end)();end if (v20(v153,2,2)~= #"}") then else v154[ #"xnx"]=(function() return v58[v154[ #"91("]];end)();end v151=(function() return 1503 -(1408 + 92) ;end)();end if (v151~=3) then else if (v20(v153, #"91(", #"asd")== #"[") then v154[ #"0313"]=(function() return v58[v154[ #".com"]];end)();end v53[v97]=(function() return v154;end)();break;end end end break;end end break;end if ((1086 -(461 + 625))==v98) then local v116=(function() return 0;end)();while true do if (v116~=(1288 -(993 + 295))) then else v99=(function() return 0 + 0 ;end)();v100=(function() return nil;end)();v116=(function() return 1;end)();end if (v116~=(1172 -(418 + 753))) then else v98=(function() return 1 + 0 ;end)();break;end end end end end for v101= #",",v23() do v54[v101-#"<" ]=(function() return v28();end)();end return v56;end break;end end end end local function v29(v59,v60,v61) local v62=v59[1 + 0 ];local v63=v59[1 + 1 ];local v64=v59[1 + 2 ];return function(...) local v68=v62;local v69=v63;local v70=v64;local v71=v27;local v72=406 -(118 + 287) ;local v73= -(530 -(406 + 123));local v74={};local v75={...};local v76=v12("#",...) -(1 + 0) ;local v77={};local v78={};for v86=1322 -(961 + 288 + 73) ,v76 do if ((v86>=v70) or (2722<=164)) then v74[v86-v70 ]=v75[v86 + (378 -(142 + 235)) ];else v78[v86]=v75[v86 + (4 -3) ];end end local v79=(v76-v70) + 1 + 0 ;local v80;local v81;while true do v80=v68[v72];v81=v80[(1622 -(41 + 435)) -(466 + (1680 -(938 + 63))) ];if (v81<=(14 -8)) then if (v81<=(3 -1)) then if (v81<=(0 -0)) then local v103=v80[1902 -(106 + 1794) ];local v104=v78[v80[1 + 2 ]];v78[v103 + 1 + 0 ]=v104;v78[v103]=v104[v80[11 -7 ]];elseif (v81==(2 -1)) then local v117=v80[116 -(4 + 110) ];v78[v117]=v78[v117](v13(v78,v117 + ((450 + 135) -(57 + 527)) ,v73));else local v119=v80[1429 -(41 + 1386) ];local v120,v121=v71(v78[v119](v13(v78,v119 + (4 -3) ,v80[756 -(239 + 514) ])));v73=(v121 + v119) -(104 -(17 + 86)) ;local v122=(1125 -(936 + 189)) + 0 ;for v139=v119,v73 do v122=v122 + (1330 -(797 + 176 + 356)) ;v78[v139]=v120[v122];end end elseif (v81<=(3 + 1)) then if (v81==(6 -3)) then v78[v80[2]]=v80[6 -3 ];else local v125=0 -0 ;local v126;local v127;local v128;local v129;while true do if ((v125==(166 -(122 + 44))) or (2408<2109)) then v126=v80[2 -0 ];v127,v128=v71(v78[v126](v13(v78,v126 + (3 -2) ,v80[(1618 -(1565 + 48)) -2 ])));v125=1 + 0 ;end if ((v125==(1 + 0)) or (33==1455)) then v73=(v128 + v126) -((1 + 0) -0) ;v129=(1203 -(782 + 356)) -(30 + (302 -(176 + 91))) ;v125=2 -0 ;end if ((v125==(2 + 0)) or (443>=4015)) then for v149=v126,v73 do local v150=1257 -(1043 + 214) ;while true do if (v150==(0 -0)) then v129=v129 + (1213 -((841 -518) + 889)) ;v78[v149]=v127[v129];break;end end end break;end end end elseif (v81>(13 -8)) then local v130=0;local v131;local v132;while true do if (v130==(1 + 0)) then v78[v131 + (1505 -(363 + 1141)) ]=v132;v78[v131]=v132[v80[584 -(361 + 219) ]];break;end if (v130==(320 -(53 + 267))) then v131=v80[1 + 1 ];v132=v78[v80[(612 -196) -(15 + 398) ]];v130=(2075 -(975 + 117)) -(18 + 964) ;end end else do return;end end elseif ((3382>166) and (v81<=(33 -24))) then if (v81<=((3857 -(157 + 1718)) -(1913 + 62))) then v78[v80[2 + 0 + 0 ]]=v61[v80[2 + 1 ]];elseif (v81==(858 -(20 + 830))) then v78[v80[2 + 0 ]]=v61[v80[129 -(116 + 10) ]];else local v135=v80[(6 -4) -0 ];v78[v135]=v78[v135](v13(v78,v135 + 1 ,v73));end elseif (v81<=(1 + 10)) then if (v81>(866 -(564 + 292))) then do return;end else v78[v80[740 -(542 + 196) ]]();end elseif ((v81==(25 -13)) or (280==3059)) then v78[v80[2]]();else v78[v80[1 + 1 ]]=v80[2 + (3 -2) ];end v72=v72 + 1 + (1018 -(697 + 321)) ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403373O00682O7470733A2O2F6769746875622E636F6D2F6C616974756E672O312O322F44756F6E672F626C6F622F6D61696E2F6D656E752E6C756100083O0012083O00013O001208000100023O002006000100010003001203000300044O0004000100034O00095O00022O000A3O000100012O00053O00017O00",v9(),...);