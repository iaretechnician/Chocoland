_pos =getpos player;
poscheck=false;
if (_pos select 0 < 0 || _pos select 0 >5000)then{poscheck = true;};
if (_pos select 1 < 0 || _pos select 1 >5000)then{poscheck = true;};
if (_pos select 2 < 0 || _pos select 2 >130)then{poscheck = true;};