module slco::AST

/*
 * Define bIdact Syntax for slco
 *
 * - make sure there is an almost one-to-one correspondence with the grammar (Syntax.rsc)
 */
 
 // Datatypes

 
 //data Type(loc src = |tmp:///|)
 //	= Iding() | integer() | boolean();
 	
 public data TYPE = natural() | Iding(); 
 
 public alias Id = str;
 
 data Program
 = Program(Model model);
 


 
 data Model
 = Model(Id modelId , list[Class] classes , list[Object] objects
 ,list[Channel] channels
 );
 
 data Class 
 = Class(Id classId ,list[Id] portIds, list[StateMachine] stateMachines
 );
 
 data StateMachine
 = StateMachine(Id stateMachineId, list[Variable] variables, Id initialState, list[Id] states ,list[Transition] transitions
 );
// 
 data Variable
 = Variable(Id variableType, Id variableId);
// 
 data VariableType
= Integer() | String();
 
 data Transition
 = Transition(Id transitionId, Id stateIdBegin, Id stateIdEnd, list[TransitionBody] transitionBodies
 );
 
 
 //TODO DIT IS MOEILIJK
 data TransitionBody
 = TransitionBody(TransitionLine transitionLine); //misschien vind ie dit niet leuk
 //
 data TransitionLine
 = TransitionLine(SendAction sendAction)
 | TransitionLine(ReceiveAction receiveAction)
 | TransitionLine(WaitAction waitAction);
 //
 data SendAction 
 = SendAction(Id actionId, Parameter outputVariable, list[Combination] combinations, 
 Id portId );
 
 data ReceiveAction
 = ReceiveAction(Id actionId, Parameter inputVariable, list[Combination] combinations, Id portId );
 
 data Combination
 = Combination(Operator operator, 
 Parameter outputVariable);
 //
 data WaitAction
 = WaitAction(int number);
 
 data Parameter
 = Parameter(int integer)
 |  Parameter(Id parameterId);
 
// TODO geen idee hoe we dit moeten doen
 data Operator
 = Operator();
 
 //data Input 
 //= Integer() |
 //String();

 data Object = 
 Object(Id objectId, Id classId);
 
 data Channel = 
 Channel(Id channelId, VariableType variableType, list[VariableType] variableTypes, 
 Id objectIdSource, Id portIdSource, 
 Id objectIdTarget, Id portIdTarget);
 


//anno loc Type@location;                   
//anno loc Program@location;
//anno loc Model@location;
//anno loc Class@location;
//anno loc StateMachine@location;
//anno loc Variable@location;     
//anno loc VariableType@location;        
//anno loc Transition@location;     
//anno loc TransitionLine@location;     
//anno loc SendAction@location;     
//anno loc ReceiveAction@location;     
//anno loc WaitAction@location;     
//anno loc Parameter@location;     
////anno loc Operator@location;     
////anno loc Input@location;     
//anno loc Object@location;     
//anno loc Channel@location;       
