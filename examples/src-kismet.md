Copy and paste the following into your Kismet editor.

### IMPORTANT
Make sure that the `FSCommand` and the `GFX Invoke Actionscript` nodes are properly linked to your flash file.

```
Begin Object Class=SeqVar_String Name=SeqVar_String_50
   VarName="mepoutput"
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-768
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_String_50"
   ObjectArchetype=SeqVar_String'Engine.Default__SeqVar_String'
End Object
Begin Object Class=SeqVar_String Name=SeqVar_String_14
   VarName="mepcommand"
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-880
   ObjPosY=-2080
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_String_14"
   ObjectArchetype=SeqVar_String'Engine.Default__SeqVar_String'
End Object
Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_0
   SizeX=634
   SizeY=137
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-904
   ObjPosY=-2120
   ObjComment="MEP variables"
   Name="SequenceFrameWrapped_0"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object
Begin Object Class=SequenceFrameWrapped Name=SequenceFrameWrapped_1
   SizeX=632
   SizeY=554
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-904
   ObjPosY=-1952
   Name="SequenceFrameWrapped_1"
   ObjectArchetype=SequenceFrameWrapped'Engine.Default__SequenceFrameWrapped'
End Object
Begin Object Class=SeqVar_Named Name=SeqVar_Named_57
   ExpectedType=Class'Engine.SeqVar_String'
   FindVarName="mepcommand"
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-600
   ObjPosY=-1496
   ObjColor=(B=0,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_57"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object
Begin Object Class=SeqAct_SetString Name=SeqAct_SetString_10
   InputLinks(0)=(DrawY=-1558,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1558,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_String'SeqVar_String_52'),DrawX=-662,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'SeqVar_Named_57'),DrawX=-606,OverrideDelta=68)
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-696
   ObjPosY=-1592
   DrawWidth=128
   DrawHeight=61
   Name="SeqAct_SetString_10"
   ObjectArchetype=SeqAct_SetString'Engine.Default__SeqAct_SetString'
End Object
Begin Object Class=SeqVar_String Name=SeqVar_String_52
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-752
   ObjPosY=-1488
   ObjComment="command"
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_String_52"
   ObjectArchetype=SeqVar_String'Engine.Default__SeqVar_String'
End Object
Begin Object Class=GFxEvent_FSCommand Name=GFxEvent_FSCommand_0
   Movie=YOUR_FLASH_MOVIE
   FSCommand="SET_MEP_COMMAND"
   MaxWidth=95
   OutputLinks(0)=(Links=((LinkedOp=SeqAct_SetString'SeqAct_SetString_10')),DrawY=-1558,OverrideDelta=11)
   VariableLinks(0)=(LinkedVariables=(SeqVar_String'SeqVar_String_52'),DrawX=-817,OverrideDelta=16)
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-864
   ObjPosY=-1624
   ObjComment="SET_MEP_COMMAND"
   DrawWidth=67
   DrawHeight=128
   Name="GFxEvent_FSCommand_0"
   ObjectArchetype=GFxEvent_FSCommand'GFxUI.Default__GFxEvent_FSCommand'
End Object
Begin Object Class=SeqVar_Named Name=SeqVar_Named_2
   ExpectedType=Class'Engine.SeqVar_String'
   FindVarName="mepoutput"
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-424
   ObjPosY=-1744
   ObjColor=(B=0,G=255,R=0,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_2"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object
Begin Object Class=SeqVar_Named Name=SeqVar_Named_3
   ExpectedType=Class'Engine.SeqVar_Object'
   FindVarName="YOUR_FLASH_MOVIE"
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-520
   ObjPosY=-1744
   ObjColor=(B=255,G=0,R=255,A=255)
   DrawWidth=32
   DrawHeight=32
   Name="SeqVar_Named_3"
   ObjectArchetype=SeqVar_Named'Engine.Default__SeqVar_Named'
End Object
Begin Object Class=GFxAction_Invoke Name=GFxAction_Invoke_0
   MethodName="MEPOutputEvent"
   InputLinks(0)=(DrawY=-1838,ActivateDelay=1.000000,OverrideDelta=11)
   OutputLinks(0)=(DrawY=-1838,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-548,OverrideDelta=16)
   VariableLinks(1)=(LinkedVariables=(SeqVar_Named'SeqVar_Named_3'),DrawX=-490,OverrideDelta=72)
   VariableLinks(2)=(LinkedVariables=(SeqVar_Named'SeqVar_Named_2'),LinkDesc="Argument[0]",MinVars=0,DrawX=-410,OverrideDelta=133)
   ObjInstanceVersion=1
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-584
   ObjPosY=-1872
   DrawWidth=232
   DrawHeight=77
   Name="GFxAction_Invoke_0"
   ObjectArchetype=GFxAction_Invoke'GFxUI.Default__GFxAction_Invoke'
End Object
Begin Object Class=SeqEvent_RemoteEvent Name=SeqEvent_RemoteEvent_2
   EventName="MEPOutputEvent"
   MaxWidth=228
   OutputLinks(0)=(Links=((LinkedOp=GFxAction_Invoke'GFxAction_Invoke_0')),DrawY=-1830,OverrideDelta=11)
   VariableLinks(0)=(DrawX=-758,OverrideDelta=82)
   ObjInstanceVersion=2
   ParentSequence=Sequence'Main_Sequence'
   ObjPosX=-872
   ObjPosY=-1896
   bSuppressAutoComment=False
   DrawWidth=134
   DrawHeight=128
   Name="SeqEvent_RemoteEvent_2"
   ObjectArchetype=SeqEvent_RemoteEvent'Engine.Default__SeqEvent_RemoteEvent'
End Object
```