//  Nome File   :  hex.cpp
//  Autore      :  Antonino Carbone
//  Data        :  2020 ott 10 18:22:55 
//  Descrizione :  checks if string is valid hex color

#include <iostream>
using namespace std;

int main()
{
        string c;
        cin>>c;

        bool b;

        if(c.size()<=7 && c[0]=='#')
        {
              for(int i=1; i<=6; i++)
              {
                      //int n = (int) c[i];
                      
                      if( (c[i]>='a' && c[i]<='f') || (c[i]<='9' && c[i]>='0') || (c[i]<='A' && c[i]>='F') )
                              b=true;
                      else
                      {
                              b=false;
                              break;
                      }

              }
        }
        else
        {
                cout<<"Hex code must start with # and be limited to six characters after it.";
                        return 1;
        }


        if(b)
                cout<<c;
        else{
                cout<<"Hex value is not valid.";
                return 1;
        }

        return 0;
}
