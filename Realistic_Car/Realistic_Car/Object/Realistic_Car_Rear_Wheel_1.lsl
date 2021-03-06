// :CATEGORY:Vehicles
// :NAME:Realistic_Car
// :AUTHOR:Anonymous
// :CREATED:2010-01-10 05:20:56.000
// :EDITED:2013-09-18 15:39:01
// :ID:686
// :NUM:932
// :REV:1.0
// :WORLD:Second Life
// :DESCRIPTION:
// Realistic Car Rear Wheel.lsl
// :CODE:

//**********************************************
//Title: Car Rear Wheel
//Author: Aaron Perkins
//Date: 2/17/2004
//**********************************************

rotation Inverse(rotation r)
{
    r.x = -r.x;
    r.y = -r.y;
    r.z = -r.z;
    return r;
}
rotation GetParentRot()
{
    return Inverse(llGetLocalRot())*llGetRot(); 
}
SetLocalRot(rotation x)
{
    llSetRot(x*Inverse(GetParentRot()));
}

default
{
    state_entry()
    {
    }

   link_message(integer sender_num, integer num, string str, key id)
    {
        
        if(str == "WHEEL_DRIVING")
        {
            state driving;
        }
                                                      
    }
        
}

state driving

{
    state_entry()
    {
        SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));
        llSetTimerEvent(0.5);
    }

    timer()
    {
        vector vel = llGetVel();
        float speed = llVecMag(vel);
         llSetTextureAnim(ANIM_ON|LOOP|SMOOTH|ROTATE,ALL_SIDES,0,0,0,0,speed);
    }

   link_message(integer sender_num, integer num, string str, key id)
    {
        if(str == "WHEEL_DEFAULT")
        {
            state default;
        }
                   
    }
    
    state_exit()
    {
        SetLocalRot(llEuler2Rot(<-1 * PI_BY_TWO,0,0> ));
        llSetTextureAnim(0,ALL_SIDES,0,0,0,0,0);
    }
    
}
// END //
