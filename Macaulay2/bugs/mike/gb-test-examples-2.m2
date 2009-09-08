-----------------------------------------------
-- med1-ZZ
R = ZZ[x,y,z,w,MonomialOrder=>Lex]
test'code = ///
  leadTerm gens gb I == matrix {{268435456*z^28, 2600338456576*y*z^20*w^6, 1300169228288*y*z^20*w^8, 650084614144*y*z^20*w^9, 126147887104*y*z^21*w^4, 16777216*y*z^21*w^5, 4194304*y*z^21*w^6, 2097152*y*z^21*w^7, 1048576*y*z^21*w^9, 2013265920*y*z^22*w^2, 16777216*y*z^22*w^3, 4194304*y*z^22*w^4, 343530274816*y*z^23, 33554432*y*z^23*w, 16777216*y*z^23*w^2, 16777216*y*z^24, 2498675370491172188323840*y^2*z^12*w^10, 1249337685245586094161920*y^2*z^12*w^11, 624668842622793047080960*y^2*z^12*w^12, 312334421311396523540480*y^2*z^12*w^13, 156167210655698261770240*y^2*z^12*w^14, 78083605327849130885120*y^2*z^12*w^15, 39041802663924565442560*y^2*z^12*w^16, 19520901331962282721280*y^2*z^12*w^17, 9760450665981141360640*y^2*z^12*w^18, 4880225332990570680320*y^2*z^12*w^19, 133633017419818996358247874560*y^2*z^13*w^8, 20971520*y^2*z^13*w^9, 10485760*y^2*z^13*w^10, 5242880*y^2*z^13*w^11, 2621440*y^2*z^13*w^12, 1310720*y^2*z^13*w^13, 655360*y^2*z^13*w^14, 327680*y^2*z^13*w^15, 163840*y^2*z^13*w^16, 81920*y^2*z^13*w^17, 40960*y^2*z^13*w^18, 20480*y^2*z^13*w^19, 10485760*y^2*z^14*w^7, 5242880*y^2*z^14*w^8, 2621440*y^2*z^14*w^9, 1310720*y^2*z^14*w^10, 655360*y^2*z^14*w^11, 327680*y^2*z^14*w^12, 163840*y^2*z^14*w^13, 81920*y^2*z^14*w^14, 29851274870650326400064552960*y^2*z^15*w^5, 20971520*y^2*z^15*w^6, 10485760*y^2*z^16*w^4, 5242880*y^2*z^16*w^5, 2621440*y^2*z^16*w^6, 1310720*y^2*z^16*w^7, 655360*y^2*z^16*w^8, 327680*y^2*z^16*w^9, 4697514002360346018735718400*y^2*z^17*w^2, 20971520*y^2*z^17*w^3, 52428800*y^2*z^18*w, 5242880*y^2*z^18*w^2, 2621440*y^2*z^18*w^3, 1310720*y^2*z^18*w^4, 20971520*y^2*z^19, 10485760*y^2*z^19*w, 1048576*y^2*z^20, 524288*y^2*z^20*w^3, 262144*y^2*z^20*w^4, 131072*y^2*z^20*w^8, 65536*y^2*z^20*w^9, 23459269116901742280935854192059661015903090821977604096*y^3*z^4*w^13, 9003700928782424433513575630340096*y^3*z^4*w^14, 1500616821463737405585595938390016*y^3*z^4*w^15, 750308410731868702792797969195008*y^3*z^4*w^16, 375154205365934351396398984597504*y^3*z^4*w^17, 187577102682967175698199492298752*y^3*z^4*w^18, 93788551341483587849099746149376*y^3*z^4*w^19, 46894275670741793924549873074688*y^3*z^4*w^20, 23447137835370896962274936537344*y^3*z^4*w^21, 11723568917685448481137468268672*y^3*z^4*w^22, 5861784458842724240568734134336*y^3*z^4*w^23, 2930892229421362120284367067168*y^3*z^4*w^24, 1465446114710681060142183533584*y^3*z^4*w^25, 1218908651520*y^3*z^5*w^12, 121890865152*y^3*z^5*w^13, 60945432576*y^3*z^5*w^14, 10157572096*y^3*z^5*w^15, 5078786048*y^3*z^5*w^16, 2539393024*y^3*z^5*w^17, 1269696512*y^3*z^5*w^18, 634848256*y^3*z^5*w^19, 317424128*y^3*z^5*w^20, 158712064*y^3*z^5*w^21, 79356032*y^3*z^5*w^22, 39678016*y^3*z^5*w^23, 19839008*y^3*z^5*w^24, 9919504*y^3*z^5*w^25, 98304*y^3*z^6*w^11, 16384*y^3*z^6*w^12, 8192*y^3*z^6*w^13, 4096*y^3*z^6*w^14, 2048*y^3*z^6*w^15, 1024*y^3*z^6*w^16, 512*y^3*z^6*w^17, 256*y^3*z^6*w^18, 128*y^3*z^6*w^19, 64*y^3*z^6*w^20, 32*y^3*z^6*w^24, 16*y^3*z^6*w^25, 1065044955346688817190029449450341633811604916508734127603712*y^3*z^7*w^9, 786432*y^3*z^7*w^10, 32768*y^3*z^7*w^11, 1572864*y^3*z^8*w^8, 16384*y^3*z^8*w^9, 4096*y^3*z^8*w^11, 1024*y^3*z^8*w^13, 256*y^3*z^8*w^15, 1048576*y^3*z^9*w^7, 524288*y^3*z^9*w^8, 742647247597258809949056645182587608235338046798104165875712*y^3*z^10*w^5, 98304*y^3*z^10*w^6, 8192*y^3*z^10*w^7, 2048*y^3*z^10*w^9, 1024*y^3*z^10*w^11, 393216*y^3*z^11*w^4, 32768*y^3*z^11*w^5, 131072*y^3*z^12*w^3, 65536*y^3*z^12*w^4, 16384*y^3*z^12*w^5, 4096*y^3*z^12*w^8, 1486263478783285097951357637504277866706980283657973923840*y^3*z^13*w, 262144*y^3*z^13*w^2, 65536*y^3*z^13*w^3, 8192*y^3*z^13*w^6, 524288*y^3*z^14, 262144*y^3*z^14*w, 131072*y^3*z^14*w^2, 16384*y^3*z^14*w^4, 262144*y^3*z^15, 131072*y^3*z^15*w, 65536*y^3*z^15*w^2, 65536*y^3*z^16, 8192*y^4*w^13, 2048*y^4*w^14, 1024*y^4*w^15, 512*y^4*w^16, 256*y^4*w^17, 128*y^4*w^18, 64*y^4*w^19, 32*y^4*w^20, 16*y^4*w^21, 8*y^4*w^22, 4*y^4*w^23, 2*y^4*w^24, y^4*w^25, 24576*y^4*z*w^12, 2048*y^4*z*w^13, 128*y^4*z*w^17, 8*y^4*z*w^21, 5812036136722087750269897484943567150311149404160*y^4*z^2*w^10, 16384*y^4*z^2*w^11, 8192*y^4*z^2*w^12, 1024*y^4*z^2*w^14, 512*y^4*z^2*w^15, 64*y^4*z^2*w^18, 32*y^4*z^2*w^19, 4*y^4*z^2*w^22, 1048576*y^4*z^3*w^9, 131072*y^4*z^3*w^10, 8192*y^4*z^3*w^11, 4096*y^4*z^3*w^12, 256*y^4*z^3*w^16, 16*y^4*z^3*w^20, 131072*y^4*z^4*w^8, 16384*y^4*z^4*w^9, 8192*y^4*z^4*w^10, 2048*y^4*z^4*w^11, 512*y^4*z^4*w^13, 128*y^4*z^4*w^15, 32*y^4*z^4*w^17, 16*y^4*z^4*w^19, 131072*y^4*z^5*w^7, 32768*y^4*z^5*w^8, 8192*y^4*z^5*w^9, 3131160117763366891605447664762659799040*y^4*z^6*w^5, 16384*y^4*z^6*w^6, 8192*y^4*z^6*w^7, 4096*y^4*z^6*w^8, 2048*y^4*z^6*w^9, 1024*y^4*z^6*w^10, 512*y^4*z^6*w^11, 256*y^4*z^6*w^12, 128*y^4*z^6*w^13, 64*y^4*z^6*w^14, 2228224*y^4*z^7*w^4, 32768*y^4*z^7*w^5, 16384*y^4*z^8*w^3, 8192*y^4*z^8*w^4, 4096*y^4*z^8*w^5, 2048*y^4*z^8*w^6, 1024*y^4*z^8*w^7, 512*y^4*z^8*w^8, 256*y^4*z^8*w^9, 205630966335127443606160713973760*y^4*z^9*w, 655360*y^4*z^9*w^2, 655360*y^4*z^10, 163840*y^4*z^10*w, 40960*y^4*z^10*w^2, 8192*y^4*z^10*w^3, 2048*y^4*z^10*w^4, 1024*y^4*z^10*w^6, 32768*y^4*z^11, 8192*y^4*z^11*w^2, 4096*y^4*z^12, 8192*y^5*w^9, 256*y^5*w^10, 128*y^5*w^11, 64*y^5*w^12, 32*y^5*w^13, 16*y^5*w^14, 8*y^5*w^15, 4*y^5*w^16, 2*y^5*w^17, y^5*w^18, 16384*y^5*z*w^8, 512*y^5*z*w^9, 5499279419473723392*y^5*z^2*w^6, 2048*y^5*z^2*w^7, 512*y^5*z^2*w^8, 256*y^5*z^2*w^9, 128*y^5*z^2*w^10, 64*y^5*z^2*w^11, 32*y^5*z^2*w^12, 16*y^5*z^2*w^13, 8*y^5*z^2*w^14, 4*y^5*z^2*w^15, 393216*y^5*z^3*w^5, 2048*y^5*z^3*w^6, 1024*y^5*z^3*w^7, 4096*y^5*z^4*w^4, 1024*y^5*z^4*w^5, 256*y^5*z^4*w^6, 128*y^5*z^4*w^7, 64*y^5*z^4*w^8, 32*y^5*z^4*w^9, 16*y^5*z^4*w^10, 101167398912*y^5*z^5*w^2, 2048*y^5*z^5*w^3, 1024*y^5*z^5*w^4, 512*y^5*z^5*w^5, 16384*y^5*z^6*w, 8192*y^5*z^6*w^2, 1024*y^5*z^6*w^3, 512*y^5*z^6*w^4, 256*y^5*z^6*w^5, 128*y^5*z^6*w^6, 64*y^5*z^6*w^7, 8192*y^5*z^7, 4096*y^5*z^7*w, 2048*y^5*z^7*w^2, 512*y^5*z^8, 256*y^5*z^8*w^3, 14680064*y^6*w^5, 256*y^6*w^6, 64*y^6*w^7, 16*y^6*w^9, 4*y^6*w^11, y^6*w^13, 2048*y^6*z*w^3, 1024*y^6*z*w^4, 256*y^6*z*w^5, 1024*y^6*z^2*w^3, 16384*y^6*z^3, 8192*y^6*z^3*w, 4096*y^6*z^3*w^2, 512*y^6*z^4, 128*y^6*z^4*w^2, 32*y^6*z^4*w^4, 16*y^6*z^4*w^6, 128*y^7, 32*y^7*w^2, 8*y^7*w^4, 2*y^7*w^6, y^7*w^9, y^8*w^8, 32*y^9, 8*y^9*w^2, 2*y^9*w^4, y^9*w^7, y^10*w^6, 8*y^11, 2*y^11*w^2, y^11*w^5, y^12*w^4, 2*y^13, y^13*w^3, y^14*w^2, y^15*w, y^16, 72284668430693657195515077*x*w^14, 2677209941877542859093151*x*w^15, 243217722773101564077933609653941111050*x*z*w^12, 940826859349659085467*x*z*w^13, 34845439235172558721*x*z*w^15, 14160984156454364485656582246471855*x*z^2*w^10, 85717848465432099*x*z^2*w^11, 4081802307877719*x*z^2*w^12, 1360600769292573*x*z^2*w^13, 453533589764191*x*z^2*w^15, 1469448830835978840*x*z^3*w^9, 2074437*x*z^3*w^10, 691479*x*z^3*w^11, 230493*x*z^3*w^12, 76831*x*z^3*w^13, 414793621681808840592396164372481284513948731920*x*z^4*w^7, 4065896520*x*z^4*w^8, 72*x*z^4*w^9, 3*x*z^4*w^10, x*z^4*w^11, 24395379120*x*z^5*w^6, 10584*x*z^5*w^7, 5292*x*z^5*w^8, 6*x*z^5*w^9, x*z^5*w^10, 2222640*x*z^6*w^5, 144*x*z^6*w^6, 24*x*z^6*w^7, 4*x*z^6*w^8, 2*x*z^6*w^9, 7702095289216494278402696097872791064294400*x*z^7*w^3, 15120*x*z^7*w^4, 3024*x*z^7*w^5, 48*x*z^7*w^6, 8*x*z^7*w^7, 62233920*x*z^8*w^2, 30240*x*z^8*w^3, 3024*x*z^8*w^4, 1008*x*z^8*w^5, 16*x*z^8*w^6, 35562240*x*z^9*w, 4032*x*z^9*w^2, 32*x*z^9*w^3, 16*x*z^9*w^4, 40320*x*z^10, 4032*x*z^10*w, 1344*x*z^10*w^2, 8064*x*z^11, 1344*x*z^11*w, 448*x*z^11*w^2, 384*x*z^12, 192*x*z^12*w, 64*x*z^12*w^2, 128*x*z^13, 64*x*z^13*w, 4148874*x*y*w^9, 691479*x*y*w^10, 76831*x*y*w^12, 244686442674910820042513065007882247217228800*x*y*z*w^7, 12960*x*y*z*w^8, 3*x*y*z*w^9, x*y*z*w^11, 155520*x*y*z^2*w^6, 36*x*y*z^2*w^7, 18*x*y*z^2*w^8, x*y*z^2*w^9, 127008*x*y*z^3*w^5, 36*x*y*z^3*w^6, 12*x*y*z^3*w^7, 2*x*y*z^3*w^8, 3024*x*y*z^4*w^4, 252*x*y*z^4*w^5, 12*x*y*z^4*w^6, 4*x*y*z^4*w^7, 3024*x*y*z^5*w^3, 504*x*y*z^5*w^4, 4*x*y*z^5*w^6, 70560*x*y*z^6*w^2, 144*x*y*z^6*w^3, 8*x*y*z^6*w^4, 4*x*y*z^6*w^5, 37310461160627601016331871879561600*x*y*z^7, 14112*x*y*z^7*w, 4704*x*y*z^7*w^2, 16*x*y*z^7*w^3, 1344*x*y*z^8, 672*x*y*z^8*w, 112*x*y*z^8*w^2, 64*x*y*z^9, 32*x*y*z^9*w, 16*x*y*z^9*w^2, 5184*x*y^2*w^6, 12*x*y^2*w^7, 6*x*y^2*w^8, x*y^2*w^9, 3556224*x*y^2*z*w^5, 36*x*y^2*z*w^6, 2*x*y^2*z*w^7, 12096*x*y^2*z^2*w^4, 252*x*y^2*z^2*w^5, 4*x*y^2*z^2*w^6, 1728*x*y^2*z^3*w^3, 144*x*y^2*z^3*w^4, 12*x*y^2*z^3*w^5, 2*x*y^2*z^3*w^6, 18522000*x*y^2*z^4*w^2, 48*x*y^2*z^4*w^3, 24*x*y^2*z^4*w^4, 4*x*y^2*z^4*w^5, 10080*x*y^2*z^5*w, 5040*x*y^2*z^5*w^2, 16*x*y^2*z^5*w^3, 8*x*y^2*z^5*w^4, 2240*x*y^2*z^6, 1120*x*y^2*z^6*w, 560*x*y^2*z^6*w^2, 64*x*y^2*z^7, 32*x*y^2*z^7*w, 16*x*y^2*z^7*w^2, 372993355284480*x*y^3*w^4, 126*x*y^3*w^5, 2*x*y^3*w^6, x*y^3*w^7, 2160*x*y^3*z*w^3, 24*x*y^3*z*w^4, 6*x*y^3*z*w^5, x*y^3*z*w^6, 58344300000*x*y^3*z^2*w^2, 24*x*y^3*z^2*w^3, 4*x*y^3*z^2*w^4, 2*x*y^3*z^2*w^5, 23520*x*y^3*z^3*w, 1680*x*y^3*z^3*w^2, 8*x*y^3*z^3*w^3, 6720*x*y^3*z^4, 3360*x*y^3*z^4*w, 560*x*y^3*z^4*w^2, 32*x*y^3*z^5, 16*x*y^3*z^5*w, 32*x*y^4*w^3, 8*x*y^4*w^4, 2*x*y^4*w^5, x*y^4*w^6, 1530869760*x*y^4*z*w, 47040*x*y^4*z*w^2, 8*x*y^4*z*w^3, 2*x*y^4*z*w^4, 26880*x*y^4*z^2, 1680*x*y^4*z^2*w, 420*x*y^4*z^2*w^2, 4*x*y^4*z^2*w^3, 160*x*y^4*z^3, 20*x*y^4*z^3*w, 40*x*y^4*z^4, 8*x*y^4*z^5, 4*x*y^4*z^5*w, 192*x*y^5, 48*x*y^5*w, 6*x*y^5*w^2, x*y^5*w^3, 32*x*y^5*z, 2*x*y^5*z*w, x*y^5*z*w^2, 8*x*y^5*z^2, 8*x*y^6, 2*x*y^6*w, x*y^6*w^2, 4*x*y^6*z^2, 2*x*y^7, x*y^7*w, x*y^8, 81*x^2*w^6, 9*x^2*w^7, 3*x^2*w^8, x^2*w^9, 3667356*x^2*z*w^4, 9261*x^2*z*w^5, 3*x^2*z*w^6, x^2*z*w^7, 756*x^2*z^2*w^3, 378*x^2*z^2*w^4, 21*x^2*z^2*w^5, x^2*z^2*w^6, 28*x^2*z^3*w^3, 14*x^2*z^3*w^4, 7*x^2*z^3*w^5, 317520*x^2*z^4, 35280*x^2*z^4*w, 17640*x^2*z^4*w^2, 7056*x^2*z^5, 2352*x^2*z^5*w, 1176*x^2*z^5*w^2, 4*x^2*z^5*w^3, 2*x^2*z^5*w^4, x^2*z^5*w^5, 112*x^2*z^6, 56*x^2*z^6*w^2, 16*x^2*z^8, 8*x^2*z^8*w^2, 756*x^2*y*w^3, 126*x^2*y*w^4, 63*x^2*y*w^5, x^2*y*w^6, 4*x^2*y*z*w^3, 2*x^2*y*z*w^4, x^2*y*z*w^5, 529200*x^2*y*z^2, 264600*x^2*y*z^2*w, 132300*x^2*y*z^2*w^2, 11760*x^2*y*z^3, 5880*x^2*y*z^3*w, 2940*x^2*y*z^3*w^2, 560*x^2*y*z^4, 280*x^2*y*z^4*w, 140*x^2*y*z^4*w^2, 16*x^2*y*z^5, 8*x^2*y*z^5*w, 4*x^2*y*z^5*w^2, x^2*y^2*w^3, 1764*x^2*y^2*z, 882*x^2*y^2*z*w^2, 252*x^2*y^2*z^2, 126*x^2*y^2*z^2*w^2, 4*x^2*y^2*z^3, 2*x^2*y^2*z^3*w^2, 10*x^2*y^3, 2*x^2*y^3*z, 5*x^2*y^4*w, x^2*y^4*z*w, 2*x^2*y^5, x^2*y^5*w, 7*x^3*w^3, x^3*w^6, 74088*x^3*z, 37044*x^3*z*w, x^3*z*w^3, 10584*x^3*z^2, 5292*x^3*z^2*w, 168*x^3*z^3, 84*x^3*z^3*w, 8*x^3*z^4, 4*x^3*z^4*w, 4*x^3*y, 2*x^3*y*w^2, x^3*y*w^3, 2*x^3*y^2, x^3*y^4, x^4}}
  ///
I = ideal((3*x+y+z+w)^4, (7*x+2*y+3*z)^4 + x*w^3, (x+y+z)^4)
-----------------------------------------------
-- elim1-
-- this is a good one...  hard in these other orders/situations
R = ZZ/32003[a..h] -- the GB here is easy
A = ZZ/32003[b,c,g]
K = frac A
R = K[a,d,f,h,e]
R = ZZ/32003[a,d,f,h,b,c,e,g,MonomialOrder=>{4,4}]
R = ZZ/32003[a,d,f,h,e,b,c,g,MonomialOrder=>{5,3}]
R = ZZ/32003[a,d,f,h,e,b,c,g,MonomialOrder=>{4,4}]
I = ideal(-a-d+e+f+h,-2*a^2+2*a*d+2*c*e+2*b*f-a-1,3*a^3-3*a^2*d+3*c^2*e+3*b^2*f+3*a^2+4*a-d,6*a^3-6*a^2*d+6*b*e*g+6*a^2-3*a*d+4*a-d,-4*a^4+4*a^3*d+4*c^3*e+4*b^3*f-6*a^3-10*a^2+4*a*d-a-1,-8*a^4+8*a^3*d+8*b*c*e*g-12*a^3+4*a^2*d-14*a^2+4*a*d-3*a-1,-12*a^4+12*a^3*d+12*b^2*e*g-18*a^3+12*a^2*d-14*a^2+8*a*d-a-1,24*a^4-24*a^3*d+36*a^3-24*a^2*d+26*a^2-8*a*d+7*a+1)
-----------------------------------------------
-- lichtblau-32003
debug ExampleIdeals
I = Lichtblau (ZZ/32003)
-----------------------------------------------
-- lichtblau-QQ
debug ExampleIdeals
I = Lichtblau QQ
