//+------------------------------------------------------------------+
//| Module: Experts/ButtonDemo.mqh                                   |
//| This file is part of the mql4-lib-examples project:              |
//|     https://github.com/dingmaotu/mql4-lib-examples               |
//|                                                                  |
//| Copyright 2015-2017 Li Ding <dingmaotu@hotmail.com>              |
//|                                                                  |
//| Licensed under the Apache License, Version 2.0 (the "License");  |
//| you may not use this file except in compliance with the License. |
//| You may obtain a copy of the License at                          |
//|                                                                  |
//|     http://www.apache.org/licenses/LICENSE-2.0                   |
//|                                                                  |
//| Unless required by applicable law or agreed to in writing,       |
//| software distributed under the License is distributed on an      |
//| "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,     |
//| either express or implied.                                       |
//| See the License for the specific language governing permissions  |
//| and limitations under the License.                               |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Li Ding"
#property link      "dingmaotu@hotmail.com"
#property version   "1.00"
#property strict

#include "UIApp.mqh"
#include <Mql/Trade/FxSymbol.mqh>
//+------------------------------------------------------------------+
//| Inherit from UIApp                                               |
//+------------------------------------------------------------------+
class ButtonDemo: public UIApp
  {
private:
   Button           *m_eurusd;
   Button           *m_usdjpy;
public:
   //--- since this EA does not have additional parameters,
   //--- we can directly use the parent class's parameter
                     ButtonDemo(UIAppParam *param);

   void              onObjectClick(string id,int x,int y);
  };
//+------------------------------------------------------------------+
//| Construct the UI                                                 |
//+------------------------------------------------------------------+
ButtonDemo::ButtonDemo(UIAppParam *param)
   :UIApp(param)
  {
   Panel *top=getPanel();

   FxSymbol seu("EURUSD");
   m_eurusd=new Button(top,"eurusd",seu.getDescription());
   m_eurusd.setPosition(0, 0);
   m_eurusd.setSize(500, 50);
   top.add(m_eurusd);

   FxSymbol suj("USDJPY");
   m_usdjpy=new Button(top,"usdjpy",suj.getDescription());
   m_usdjpy.setPosition(0, m_eurusd.getY()+50);
   m_usdjpy.setSize(500, 50);
   top.add(m_usdjpy);

   refresh();
  }
//+------------------------------------------------------------------+
//| Handle button press                                              |
//+------------------------------------------------------------------+
void ButtonDemo::onObjectClick(string id,int x,int y)
  {
   Print(">>> ButtonDemo::onObjectClick: ID is ",id);
   if(id==m_eurusd.getName())
     {
      MessageBox("You pressed the EURUSD button");
      m_eurusd.resetBtn();
     }
   else if(id==m_usdjpy.getName())
     {
      MessageBox("You pressed the USDJPY button");
      m_usdjpy.resetBtn();
     }
  }

BEGIN_INPUT(UIAppParam)
   INPUT(color,Background,clrBlue);  // Background Color
END_INPUT

DECLARE_EA(ButtonDemo,true);
//+------------------------------------------------------------------+
