 _payment =_this select 0;
player globalchat format["test %1",_payment];
 _var="choco";
      _chocos=0;
      _random =0;
      if(_payment==0)then{_chocos =( player getvariable "choco")*2;
       _random = floor (random 100);
       if(_random >50)then {player setvariable["choco",_chocos,true];hint"you're realy lucky, YOU WON"}
       else{player setvariable["choco",0,true];hint"you're not lucky this time, you lost all XD";PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";};
   }
       
       else{_chocos =( player getvariable "bounty")*2;
       _random = floor (random 100);
       if(_random >50)then {player setvariable["bounty",_Chocos,true];hint"you're realy lucky, YOU WON"}
       else{player setvariable["bounty",0,true];hint"you're not lucky this time, you lost all XD";PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";};};
     